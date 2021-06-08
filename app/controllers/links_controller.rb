class LinksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    short_link = CreateShortLink.new(params[:original_link]).call
    render json: short_link
  end

  def top
    top_links = ShortLinks::Repository.top_links
    render json: top_links, status: :ok
  end

  def update_count
    ShortLinks::Repository.update_count(params[:short_link])
    render json: { message: 'ok' }, status: :ok
  end
end
