class SendsController < ApplicationController
  before_action :set_send, only: [:show, :edit, :update, :destroy]

  # GET /sends
  # GET /sends.json
  def index
    @sends = Send.all
  end

  # GET /sends/1
  # GET /sends/1.json
  def show
  end

  # GET /sends/new
  def new
    @send = Send.new
  end

  # GET /sends/1/edit
  def edit
  end

  # POST /sends
  # POST /sends.json
  def create
    @send = Send.new(send_params)

    respond_to do |format|
      if @send.save
        format.html { redirect_to @send, notice: 'Send was successfully created.' }
        format.json { render action: 'show', status: :created, location: @send }
      else
        format.html { render action: 'new' }
        format.json { render json: @send.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sends/1
  # PATCH/PUT /sends/1.json
  def update
    respond_to do |format|
      if @send.update(send_params)
        format.html { redirect_to @send, notice: 'Send was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @send.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sends/1
  # DELETE /sends/1.json
  def destroy
    @send.destroy
    respond_to do |format|
      format.html { redirect_to sends_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_send
      @send = Send.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def send_params
      params[:send]
    end
end
