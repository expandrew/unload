class UploadsController < ApplicationController
  def index
    @uploads = Upload.all
    @upload = Upload.new
  end

  def create
    @upload = Upload.new(upload_params)

    if @upload.save
      render json: { message: "success", fileID: @upload.id }, status: 200
    else
      render json: { error: @upload.errors.full_messages.join(',')}, status: 400
    end
  end

private

  def upload_params
    params.require(:upload).permit(:image)
  end
end
