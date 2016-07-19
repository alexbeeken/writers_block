class UploadsController < ApplicationController
  def create
    upload = Upload.create(upload_params)
    cl_response = ClarifaiRuby::TagRequest.new.get(upload.image.url)
    words = cl_response.tag_images[0].tags_by_words
    pg = PhraseGenerator.new(words)
    Phrase.create(
      words: words,
      content: pg.perform,
      upload: upload
    )
    redirect_to root_path
  end

  private

  def upload_params
    params.require(:upload).permit(:image)
  end
end
