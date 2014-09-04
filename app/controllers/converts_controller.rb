class ConvertsController < ApplicationController
  before_action :set_convert, only: [:show, :edit, :update, :destroy]

  # GET /converts
  def index
    @user=current_user
    @converts = @user.Converts.all
    shrimp
  end

  # GET /converts/1
  def show
    @convert=@user.Converts.find(params[:id])
  end

  # GET /converts/new
  def new
    @user=current_user
    @convert = @user.Converts.new
  end

  # GET /converts/1/edit
  def edit
  end

  # POST /converts
  def create
    @user=current_user
    @convert = @user.Converts.new(convert_params)

    if @convert.save
      redirect_to @convert, notice: 'Convert was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /converts/1
  def update
    if @convert.update(convert_params)
      redirect_to @convert, notice: 'Convert was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /converts/1
  def destroy
    @convert.destroy
    redirect_to converts_url, notice: 'Convert was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_convert
      @user=current_user
      @convert = @user.Convert.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def convert_params
      params.require(:convert).permit(:download, :user_id)
    end

    def shrimp
      @user=current_user
      @converts = @user.Converts.all
      Prawn::Document.generate("public/#{@user.netid}.pdf", {:page_size => 'A4', :skip_page_creation => true}) do |pdf|
        counter = 1
        @converts.each do |pdf_file|
          if File.exists?("./public#{pdf_file.download}")
            outline = nil
            pdf_temp_nb_pages = Prawn::Document.new(:template => "./public#{pdf_file.download}").page_count
            (1..pdf_temp_nb_pages).each do |i|
            pdf.start_new_page(:template => "./public#{pdf_file.download}", :template_page => i)
            pdf.outline.update do
              if outline == nil
                section "#{pdf_file.download}", :destination => counter, :closed => true #do
                outline = 1
              end
              page :destination => counter, :title => "Page #{i}"
              counter +=1
              #end
            end
          end
        end
      end
    end

  end

end
