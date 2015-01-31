class CompileController < ApplicationController
  def index
    add_crumb 'Dossier Preview', convert_path
  end

  def begin
    @user=current_user
    @counter = 0
    @user.Categories.each do |category|
      category.Converts.each do |convert|
        #Purge all the old entries
        convert.destroy
      end
      # For the progress bar
      @counter += category.Uploads.length
    end
  end
                  
    
  def reciprocal
    user=current_user
    @catindex=params[:category].to_i
    @uploadindex=params[:upload].to_i
    category=user.categories[@catindex]
    if category
      @category=category.name
      upload=category.uploads[@uploadindex]
      if upload
        @upload=upload.upload_file_name
        conversion = Cloudconvert::Conversion.new
        conversion.convert "ps", "pdf", "http://#{local_ip}" + upload.upload.url
        @step = conversion.status["step"]
        until (@step =~ /error|finished/)
          @step = conversion.status["step"]
          puts @step
          sleep 1
        end
        @uploadindex += 1
        puts conversion.download_link
        category.converts.create download: conversion.download_link
      else
        @uploadindex = 0
        @catindex += 1
      end
    else
      @done=true
    end
  end

  def compile
    @user=current_user
    @categories=@user.Categories.all
    #Generates the PDF File
    Prawn::Document.generate "public/#{@user.netid}.pdf", {:page_size => 'A4', :skip_page_creation => true} do |pdf|
      #This tracks the page number
      counter = 1
      #Run through each category
      @categories.each do |category|
        @converts = category.Converts.all
        #Loop through all the converted files in each category
        @converts.each do |pdf_file|
          #Checks if file exists to avoid exception if it doesn't for some reason
          if File.exists? "./public#{pdf_file.download}"
            outline = false #Flag for file index
            sectionindex = nil #Flag for section/category index
            #Uses Prawn templates to make the new page
            pdf_temp_nb_pages = Prawn::Document.new(template: "./public#{pdf_file.download}").page_count
            (1..pdf_temp_nb_pages).each do |i|
              pdf.start_new_page template: "./public#{pdf_file.download}", template_page: i
              #Adds marker for each section
              unless sectionindex
                pdf.outline.update do
                  section "#{category.name}", destination: counter, closed: true #do
                  sectionindex=1
                end #END Category add
              end #END category add check
              unless outline #Checks if it's the first page in each document to add a section
                pdf.outline.add_subsection_to "#{category.name}" do
                  #Creates a section for each new document
                  pdf.outline.page destination: counter, title: "#{pdf_file.download_file_name.split(".pdf").shift}" #do
                  outline = true
              end #END First page check/section add
              #Creates a marker to each page
              #page :destination => counter, :title => "Page #{i}"
            end #END Outline Update per page
            counter +=1
            end #END Make each page
          end #END if File exists
        end #END each converted document
      end #END each category
    end #END PDF
  end
end
