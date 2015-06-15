class UploaderController < ApplicationController
  before_action :set_upload_url, only: :upload

  def index
    render 'index'
  end

  def upload
    if @upload_url
      render 'upload'
    else
      redirect_to upload_path, notice: 'This Upload URL was invalid.'
    end
  end

  private

  def set_upload_url
    @upload_url = UploadUrl.find_by(code: params[:code])
  end
end
