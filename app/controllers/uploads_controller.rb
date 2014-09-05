class UploadsController < ApplicationController
  # GET /uploads
  # GET /uploads.json
  def index
    #@user = User.find(params[:user_id])
    @user=current_user
    @category=@user.Categories.find(params[:category_id])
    #Uploads belong to Categories which belong to Users
    @uploads = @category.Uploads.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @uploads.map{|upload| upload.to_jq_upload } }
    end
  end

  # GET /uploads/1
  # GET /uploads/1.json
  def show
    @user = current_user
    @category = @user.Categories.find(params[:category_id])
    @upload = @category.Uploads.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @upload }
    end
   end

  # GET /uploads/new
  # GET /uploads/new.json
  def new
    @user = current_user
    @category = @user.Categories.find(params[:category_id])
    @upload = @category.Uploads.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @upload }
    end
  end

  # GET /uploads/1/edit
  def edit
    @user = current_user
    @category=@user.Categories.find(params[:category_id])
    @upload = @category.Uploads.find(params[:id])
  end

  # POST /uploads
  # POST /uploads.json
  def create
    @user = current_user
    @category = @user.Categories.find(params[:category_id])
    @upload = @category.Uploads.new(upload_params) #(params[:upload])

    respond_to do |format|
      if @upload.save
        format.html {
          #Send back the JS to the page so it doesn't have to reload
          render :json => [@upload.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json { render json: {files: [@upload.to_jq_upload]}, status: :created, location: @category }
      else
        format.html { render action: "new" }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /uploads/1
  # PUT /uploads/1.json
  def update
    @user = current_user
    @category = @user.Categories.find(params[:category_id])
    @upload = @category.Uploads.find(params[:id])

    respond_to do |format|
      if @upload.update_attributes(params[:upload])
        format.html { redirect_to @upload, notice: 'Upload was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uploads/1
  # DELETE /uploads/1.json
  def destroy
    @user = current_user
    @category = @user.Categories.find(params[:category_id])
    @upload = @category.Uploads.find(params[:id])
    @upload.destroy

    respond_to do |format|
      format.html { redirect_to uploads_url }
      format.json { head :no_content }
    end
  end
  def upload_params
    params.require(:upload).permit(:upload,:category_id)
  end
end
