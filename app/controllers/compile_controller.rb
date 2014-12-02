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
    category=user.Categories[@catindex]
    if category
      @category=category.name
      upload=category.Uploads[@uploadindex]
      if upload
        @upload=upload.upload_file_name
        conversion = Cloudconvert::Conversion.new
        conversion.convert( "ps", "pdf", "http://#{local_ip}" + upload.upload.url)
        @step = conversion.status["step"]
        until (@step =~ /error|finished/)
          @step = conversion.status["step"]
          puts @step
          sleep 1
        end
        @uploadindex += 1
        puts conversion.download_link
        category.Converts.create(download: conversion.download_link)
      else
        @uploadindex = 0
        @catindex += 1
      end
    else
      @done=true
    end
  end

end
