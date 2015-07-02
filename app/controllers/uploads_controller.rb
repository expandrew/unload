class UploadsController < ApplicationController
  before_action :set_folder, only: [ :validate_code, :new, :create ]

  def enter_code
  end

  def validate_code
    if @folder
      redirect_to upload_code_path(@folder.upload_code)
    else
      redirect_to enter_upload_code_path, notice: 'Your Upload Code was invalid.'
    end
  end

  def new
    if @folder
      @upload = @folder.uploads.new(folder_id: @folder.id)
    else
      redirect_to enter_upload_code_path, notice: 'Your Upload Code was invalid.'
    end
  end

  def create
    @upload = @folder.uploads.new(upload_params)

    if @upload.save
      render json: { message: "success", fileID: @upload.id }, status: 200
    else
      render json: { error: @upload.errors.full_messages.join(',')}, status: 400
    end
  end

private

  def set_folder
    code = params[:code].upcase
    @folder = Folder.find_by(upload_code: code)
  end

  def upload_params
    params.require(:upload).permit(:image)
  end
end
