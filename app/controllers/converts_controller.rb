class ConvertsController < ApplicationController
  before_action :set_convert, only: [:show, :edit, :update, :destroy]

  # GET /converts
  def index
    @user=User.find(params[:user_id])
    @converts = @user.Converts.all
    shrimp
  end

  # GET /converts/1
  def show
    @user=User.find(params[:user_id])
    @convert=User.Converts.find(params[:id])
  end

  # GET /converts/new
  def new
    @user=User.find(params[:user_id])
    @convert = @user.Converts.new
  end

  # GET /converts/1/edit
  def edit
  end

  # POST /converts
  def create
    @user=User.find(params[:user_id])
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
      @convert = Convert.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def convert_params
      params.require(:convert).permit(:download, :user_id)
    end

    def shrimp
      @user=User.find(params[:user_id])
      @converts = @user.Converts.all
      #pdf_file_paths = ["1.pdf", "2.pdf"]
      Prawn::Document.generate("public/#{session[:cas_user]}.pdf", {:page_size => 'A4', :skip_page_creation => true}) do |pdf|
        @converts.each do |pdf_file|
          if File.exists?("./public#{pdf_file.download}")
            pdf_temp_nb_pages = Prawn::Document.new(:template => "./public#{pdf_file.download}").page_count
            (1..pdf_temp_nb_pages).each do |i|
            pdf.start_new_page(:template => "./public#{pdf_file.download}", :template_page => i)
          end
        end
      end
    end
  end
end
