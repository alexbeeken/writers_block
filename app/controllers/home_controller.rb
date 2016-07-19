class HomeController < ApplicationController
  def index
    @phrases = Phrase.order('id desc').take(10)
    @upload = Upload.new
    render :index
  end
end
