class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @users = User.all
    if current_user
      redirect_to uploads_path
    else
      redirect_to "/users/new"
    end
  end

  # GET /users/1
  def show
    redirect_to uploads_path
  end

  # GET /users/new
  def new
    @user = User.new
    render layout: 'newuser'
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def convert
    @user=current_user
    @user.Converts.each do |convert|
      convert.destroy
    end
    #upload=Upload.find(params[:id])
    @counter=0
    @user.Uploads.each do |upload|
      conversion = Cloudconvert::Conversion.new
      conversion.convert( "ps", "pdf", "http://#{local_ip}" + upload.upload.url)
      step = conversion.status["step"]
      until (step =~ /error|finished/)
        step = conversion.status["step"]
        puts step
        sleep 1
      end
      @counter += 1
      @user.Converts.create(download: conversion.download_link)
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      #@user = User.find(params[:id])
      @user=current_user
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:netid, :name, :role)
    end
end
