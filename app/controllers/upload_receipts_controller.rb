class UploadReceiptsController < ApplicationController
  before_action :set_folder
  before_action :set_upload_receipt, only: [:show, :edit, :update, :destroy]

  # GET /folders/123/upload_receipts
  def index
    @upload_receipts = @folder.upload_receipts.all
  end

  # GET /folders/123/upload_receipts/1
  def show
  end

  # GET /folders/123/upload_receipts/new
  def new
    @upload_receipt = @folder.upload_receipts.new
  end

  # GET /folders/123/upload_receipts/1/edit
  def edit
  end

  # POST /folders/123/upload_receipts
  def create
    @upload_receipt = @folder.upload_receipts.new(upload_receipt_params)

    if @upload_receipt.save
      redirect_to [@folder, @upload_receipt], notice: 'Upload receipt was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /folders/123/upload_receipts/1
  def update
    if @upload_receipt.update(upload_receipt_params)
      redirect_to [@folder, @upload_receipt], notice: 'Upload receipt was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /folders/123/upload_receipts/1
  def destroy
    @upload_receipt.destroy
    redirect_to folder_upload_receipts_path(@folder), notice: 'Upload receipt was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upload_receipt
      @upload_receipt = UploadReceipt.find(params[:id])
    end

    def set_folder
      @folder = Folder.find(params[:folder_id])
    end

    # Only allow a trusted parameter "white list" through.
    def upload_receipt_params
      params.require(:upload_receipt).permit(:file_name, :folder_id)
    end
end
