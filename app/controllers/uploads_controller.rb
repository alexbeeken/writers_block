class UploadsController < ApplicationController
  def create
    u = Upload.create(upload_params)
    redirect_to root_path
  end

  private

  def upload_params
    params.require(:upload).permit(:image)
  end
end
