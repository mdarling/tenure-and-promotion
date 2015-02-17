class RecusalsController < ApplicationController
  before_action :set_recusal, only: [:show, :edit, :update, :destroy]

  # GET /recusals
  def index
    @recusals = Recusal.all
  end

  # GET /recusals/1
  def show
  end

  # GET /recusals/new
  def new
    @recusal = Recusal.new
  end

  # GET /recusals/1/edit
  def edit
  end

  # POST /recusals
  def create
    @recusal = Recusal.new(recusal_params)

    if @recusal.save
      redirect_to @recusal, notice: 'Recusal was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /recusals/1
  def update
    if @recusal.update(recusal_params)
      redirect_to @recusal, notice: 'Recusal was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /recusals/1
  def destroy
    @recusal.destroy
    redirect_to recusals_url, notice: 'Recusal was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recusal
      @recusal = Recusal.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def recusal_params
      params.require(:recusal).permit(:user_id, :candidate_id)
    end
end
