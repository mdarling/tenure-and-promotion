class CompileController < ApplicationController
  def convert
    @user=current_user
    @categories=@user.Categories.each
    @categories.each do |category|
      category.Converts.each do |convert|
        #Purge all the old entries
        convert.destroy
      end
    end
    @counter=0
    @categories.each do |category|
      category.Uploads.each do |upload|
        conversion = Cloudconvert::Conversion.new
        #Tell CloudConvert to get the files
        conversion.convert( "ps", "pdf", "http://#{local_ip}" + upload.upload.url)
        step = conversion.status["step"]
        #Send one file at a time, to keep track
        until (step =~ /error|finished/)
          step = conversion.status["step"]
          puts step
          sleep 1
        end
        @counter += 1
        puts conversion.download_link
        #Add the converted file back into ActiveRecord as a convert
        category.Converts.create(download: conversion.download_link)
      end
    end
  end
end
