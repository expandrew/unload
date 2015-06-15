class UploaderController < ApplicationController
  before_action :set_folder, only: :upload

  def index
    render 'index'
  end

  def upload
    if @folder
      render 'upload'
    else
      redirect_to upload_path, notice: 'Your Upload Code was invalid.'
    end
  end

  private

  def set_folder
    @folder = Folder.find_by(upload_code: params[:code])
  end
end
