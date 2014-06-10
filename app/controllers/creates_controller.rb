class CreatesController < ApplicationController
  before_action :set_create, only: [:show, :edit, :update, :destroy]

  # GET /creates
  # GET /creates.json
  def index
    @creates = Create.all
  end

  # GET /creates/1
  # GET /creates/1.json
  def show
  end

  # GET /creates/new
  def new
    @create = Create.new
  end

  # GET /creates/1/edit
  def edit
  end

  # POST /creates
  # POST /creates.json
  def create
    @create = Create.new(create_params)

    respond_to do |format|
      if @create.save
        format.html { redirect_to @create, notice: 'Create was successfully created.' }
        format.json { render action: 'show', status: :created, location: @create }
      else
        format.html { render action: 'new' }
        format.json { render json: @create.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /creates/1
  # PATCH/PUT /creates/1.json
  def update
    respond_to do |format|
      if @create.update(create_params)
        format.html { redirect_to @create, notice: 'Create was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @create.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /creates/1
  # DELETE /creates/1.json
  def destroy
    @create.destroy
    respond_to do |format|
      format.html { redirect_to creates_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_create
      @create = Create.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def create_params
      params[:create]
    end
end
