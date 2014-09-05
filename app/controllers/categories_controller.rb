class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  def index
    @user=current_user
    #Categories each belong to a user
    @categories = @user.Categories.all
  end

  # GET /categories/1
  def show
  end

  # GET /categories/new
  def new
    @user=current_user
    @category = @user.Categories.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  def create
    @user=current_user
    @category = @user.Categories.new(category_params)

    if @category.save
      redirect_to @category, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /categories/1
  def update
    if @category.update(category_params)
      redirect_to @category, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /categories/1
  def destroy
    @category.destroy
    redirect_to categories_url, notice: 'Category was successfully destroyed.'
  end

  #This converts the files to PDF using CloudConvert.
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
        #Add the converted file back into ActiveRecord as a convert
        category.Converts.create(download: conversion.download_link)
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @user=current_user
      @category = @user.Categories.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def category_params
      params.require(:category).permit(:name, :user_id)
    end
end
