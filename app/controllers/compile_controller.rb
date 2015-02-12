class CompileController < ApplicationController
  def index
    add_crumb 'Dossier Preview', compile_path
  end

  def begin
    @user=current_user
    @counter = 0
    @user.categories.each { |c| @counter += c.uploads.length }
  end
                  
    
  def reciprocal
    @catindex=params[:category].to_i
    @uploadindex=params[:upload].to_i
    category=current_user.categories[@catindex]
    if category
      @category=category.name
      upload=category.uploads[@uploadindex]
      if upload
        @upload=upload.upload_file_name
        @uploadindex += 1
        upload.convert ? download=false : download = convert(upload)
        category.converts.create download: download, upload: upload if download 
      else
        @uploadindex = 0
        @catindex += 1
      end
    else
      @done=true
    end
  end

  def compile
    user=current_user
    @categories=user.categories.all
    #Generates the PDF File
    Prawn::Document.generate "public/#{user.netid}.pdf", {page_size: 'A4', skip_page_creation: true} do |pdf|
      #This tracks the page number
      @counter = 1
      #Run through each category
      @categories.each do |category|
        #Loop through all the converted files in each category
        category.converts.each do |pdf_file|
          concat pdf,pdf_file,category.name
        end #END each converted document
      end #END each category
    end #END PDF
  end

  private

  def convert upload
    conversion = Cloudconvert::Conversion.new
    conversion.convert "ps", "pdf", "http://#{local_ip}" + upload.upload.url
    until conversion.status["step"] =~ /error|finished/
      sleep 1
    end
    @step = conversion.status["step"]
    if @step=="finished"
      conversion.download_link + "/" + conversion.status["output"]["filename"]
    else
      nil
    end
  end

  def concat pdf,pdf_file,category
    if File.exists? "./public#{pdf_file.download}"
      #Uses Prawn templates to make the new page
      pdf_file_pages = Prawn::Document.new(template: "./public#{pdf_file.download}").page_count
      pdf.outline.update { section category, destination: @counter, closed: true }
      (1..pdf_file_pages).each do |page|
        pdf.start_new_page template: "./public#{pdf_file.download}", template_page: page
        #Adds marker for each section
        if page==1 #Checks if it's the first page in each document to add a section
          pdf.outline.add_subsection_to category do
            #Creates a section for each new document
            pdf.outline.page destination: @counter, title: pdf_file.download_file_name.chomp(".pdf")
          end #END First page check/section add
        end #END Outline Update per page
        @counter +=1
      end #END Make each page
    end #END if File exists
  end

end
