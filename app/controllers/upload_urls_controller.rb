class UploadUrlsController < ApplicationController
  before_action :set_folder
  before_action :set_upload_url, only: [:show, :edit, :update, :destroy]

  # GET /folders/123/upload_urls
  def index
    @upload_urls = @folder.upload_urls.all
  end

  # GET /folders/123/upload_urls/1
  def show
  end

  # GET /folders/123/upload_urls/new
  def new
    @upload_url = @folder.upload_urls.new
  end

  # GET /folders/123/upload_urls/1/edit
  def edit
  end

  # POST /folders/123/upload_urls
  def create
    @upload_url = @folder.upload_urls.new(upload_url_params)

    if @upload_url.save
      redirect_to folder_path(@folder), notice: 'Upload url was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /folders/123/upload_urls/1
  def update
    if @upload_url.update(upload_url_params)
      redirect_to [@folder, @upload_url], notice: 'Upload url was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /folders/123/upload_urls/1
  def destroy
    @upload_url.destroy
    redirect_to folder_path(@folder), notice: 'Upload url was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_folder
      @folder = Folder.find(params[:folder_id])
    end

    def set_upload_url
      @upload_url = @folder.upload_urls.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def upload_url_params
      params.require(:upload_url).permit(:code, :folder_id)
    end
end
