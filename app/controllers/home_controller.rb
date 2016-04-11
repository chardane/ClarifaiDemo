class HomeController < ApplicationController
  def index
    @tag_response = []
    @tags = []
    get_tags if params[:image_url].present?
  end

  private

  def get_tags
    @image_url = params[:image_url]
    @tag_response = ClarifaiRuby::TagRequest.new.get(params[:image_url])
    @tags = @tag_response.tag_images.first.tags_by_words
  end
end
