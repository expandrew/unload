class UploadUrlsController < ApplicationController
  before_action :set_upload_url, only: [:show, :edit, :update, :destroy]

  # GET /upload_urls
  def index
    @upload_urls = UploadUrl.all
  end

  # GET /upload_urls/1
  def show
  end

  # GET /upload_urls/new
  def new
    @upload_url = UploadUrl.new
  end

  # GET /upload_urls/1/edit
  def edit
  end

  # POST /upload_urls
  def create
    @upload_url = UploadUrl.new(upload_url_params)

    if @upload_url.save
      redirect_to @upload_url, notice: 'Upload url was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /upload_urls/1
  def update
    if @upload_url.update(upload_url_params)
      redirect_to @upload_url, notice: 'Upload url was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /upload_urls/1
  def destroy
    @upload_url.destroy
    redirect_to upload_urls_url, notice: 'Upload url was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upload_url
      @upload_url = UploadUrl.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def upload_url_params
      params.require(:upload_url).permit(:code, :folder_id)
    end
end
