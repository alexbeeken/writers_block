class HomeController < ApplicationController
  def index
    @phrases = Phrase.take(5)
    @upload = Upload.new
    render :index
  end
end
