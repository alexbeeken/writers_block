class UploadsController < ApplicationController
  def create
    upload = Upload.create(upload_params)
    Phrase.create(
      words: words,
      content: PhraseGenerator.new(get_clarifai_tags),
      upload: upload
    )
    redirect_to root_path
  end

  private

  def get_clarifai_tags(upload)
    cl_response = ClarifaiRuby::TagRequest.new.get(upload.image.url)
    cl_response.tag_images[0].tags_by_words.join(' ')
  end

  def upload_params
    params.require(:upload).permit(:image)
  end
end
