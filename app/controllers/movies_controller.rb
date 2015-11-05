class MoviesController < ApplicationController

  ENDPOINT = "https://api-public.guidebox.com/v1.43/US/#{Rails.application.secrets[:guidebox_api_key]}"
  PER_PAGE = 15

  def index
    @page = params[:page].to_i || 1
    @key = "movies/all/#{(@page*PER_PAGE)-PER_PAGE}/#{@page*PER_PAGE}"

    @movies = Rails.cache.fetch(@key) do
      uri = URI("#{ENDPOINT}/#{@key}/free/web")
      response = JSON.parse(Net::HTTP.get(uri))
      response["results"]
    end
  end

  def show
    @movie = Rails.cache.fetch("movie:#{params[:id]}") do
      uri = URI("https://api-public.guidebox.com/v1.43/US/#{Rails.application.secrets[:guidebox_api_key]}/movie/#{params[:id]}")
      JSON.parse(Net::HTTP.get(uri))
    end

    @reviews = Review.where(movie_id: params[:id])

  end

end
