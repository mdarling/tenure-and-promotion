class CompileController < ApplicationController
  before_action :set_user
  def index
    add_crumb 'Dossier Preview', compile_path
  end

  def begin
    @counter = 0
    appropriate(@user.categories).each { |c| @counter += c.uploads.length }
  end
                  
    
  def reciprocal
    @catindex = params[:category].to_i
    @uploadindex = params[:upload].to_i
    categories = appropriate @user.categories
    category = categories[@catindex]
    if category
      @category = category.name
      upload = category.uploads[@uploadindex]
      if upload
        @upload = upload.upload_file_name
        @uploadindex += 1
        upload.convert ? download = false : download = convert(upload)
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
    #dossier=Tempfile.new 'pdf'
    dossier = Prawn::Document.new page_size: 'A4', skip_page_creation: true do |pdf|
      #This tracks the page number
      @counter = 1
      appropriate(@user.categories).each { |category| add_to_pdf pdf,category if category.uploads.any? }
    end
    @user.update dossier: to_pdf(dossier.render)
  end

  private

  def set_user
    @user=context_user
  end

  def appropriate categories
    categories.select { |category| current_user.level >= category.level && Section.find_by_name(category.name).pdf }
  end

  def convert upload
    conversion = Cloudconvert::Conversion.new
    intype = upload.upload.url.split(".").last
    conversion.convert intype, "pdf", "http://#{local_ip}" + upload.upload.url
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

  def add_to_pdf pdf,category
    pdf.outline.update { section category.name, destination: @counter}
    category.converts.each { |file| concat pdf,file,category.name }
  end

  def concat pdf,file,category
    if File.exists? "./public#{file.download}"
      #Uses Prawn templates to make the new page
      file_pages = Prawn::Document.new(template: "./public#{file.download}").page_count
      (1..file_pages).each do |page|
        pdf.start_new_page template: "./public#{file.download}", template_page: page
        #Adds marker for each section
        if page==1 #Checks if it's the first page in each document to add a section
          pdf.outline.add_subsection_to category do
            #Creates a section for each new document
            pdf.outline.page destination: @counter, title: file.download_file_name.chomp(".pdf")
          end #END First page check/section add
        end #END Outline Update per page
        @counter +=1
      end #END Make each page
    end #END if File exists
  end

  def to_pdf dossier
    file = StringIO.new dossier #mimic a real upload file
    file.class.class_eval { attr_accessor :original_filename, :content_type } #add attr's that paperclip needs
    file.original_filename = "dossier.pdf"
    file.content_type = "application/pdf"
    file
  end

end
