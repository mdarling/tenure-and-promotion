class ConvertsController < ApplicationController
  skip_before_filter :cas_filter
  before_action :set_convert, only: [:show, :edit, :update, :destroy]

  # GET /converts
  # GET /converts.json
  def index
    @converts = Convert.all
  end

  # GET /converts/1
  # GET /converts/1.json
  def show
  end

  # GET /converts/new
  def new
    @convert = Convert.new
  end

  # GET /converts/1/edit
  def edit
  end

  # POST /converts
  # POST /converts.json
  def create
    @convert = Convert.new(cid: params[:id],url: params[:url],step: params[:step])#(convert_params)

    respond_to do |format|
      if @convert.save
        format.html { redirect_to @convert, notice: 'Convert was successfully created.' }
        format.json { render action: 'show', status: :created, location: @convert }
      else
        format.html { render action: 'new' }
        format.json { render json: @convert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /converts/1
  # PATCH/PUT /converts/1.json
  def update
    respond_to do |format|
      if @convert.update(convert_params)
        format.html { redirect_to @convert, notice: 'Convert was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @convert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /converts/1
  # DELETE /converts/1.json
  def destroy
    @convert.destroy
    respond_to do |format|
      format.html { redirect_to converts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_convert
      @convert = Convert.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def convert_params
      params.require(:convert).permit(:cid, :url, :step)
    end
end
