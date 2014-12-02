class ConvertsController < ApplicationController
  before_action :set_convert, only: [:show, :edit, :update, :destroy]
  # GET /converts
  def index
    add_crumb "Dossier Preview", "/compile"
    add_crumb "Dossier Download", "/converts"
    @user=current_user
    @categories=@user.Categories.all
    #@converts = @categories.Converts.all
    shrimp
  end

  # GET /converts/1
  def show
    @convert=@user.Categories.Converts.find(params[:id])
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

    #Compile with Prawn
    def shrimp
      @user=current_user
      @categories=@user.Categories.all
        #Generates the PDF File
      Prawn::Document.generate("public/#{@user.netid}.pdf", {:page_size => 'A4', :skip_page_creation => true}) do |pdf|
        #This tracks the page number
        counter = 1
        #Run through each category
        @categories.each do |category|
          @converts = category.Converts.all
          #Loop through all the converted files in each category
          @converts.each do |pdf_file|
            #Checks if file exists to avoid exception if it doesn't for some reason
            if File.exists?("./public#{pdf_file.download}")
              outline = nil #Flag for file index
              sectionindex = nil #Flag for section/category index
              #Uses Prawn templates to make the new page
              pdf_temp_nb_pages = Prawn::Document.new(:template => "./public#{pdf_file.download}").page_count
              (1..pdf_temp_nb_pages).each do |i|
                pdf.start_new_page(:template => "./public#{pdf_file.download}", :template_page => i)
                #Adds marker for each section
                if !sectionindex
                  pdf.outline.update do
                    section "#{category.name}", :destination => counter, :closed => true #do
                    sectionindex=1
                  end #END Category add
                end #END category add check
                if !outline #Checks if it's the first page in each document to add a section
                  pdf.outline.add_subsection_to "#{category.name}" do
                    #Creates a section for each new document
                    pdf.outline.page :destination => counter, :title => "#{pdf_file.download_file_name.split(".pdf").shift}" #do
                    outline = 1
                  end #END First page check/section add
                #Creates a marker to each page
                #page :destination => counter, :title => "Page #{i}"
              end #END Outline Update per page
            counter +=1
            end #END Make each page
          end #END if File exists
        end #END each converted document
      end #END each category
    end #END PDF
  end
end
