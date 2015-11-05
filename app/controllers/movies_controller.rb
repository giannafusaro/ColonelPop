class MoviesController < ApplicationController

  def index
    @movies = Rails.cache.fetch("movies:all") do
      uri = URI("https://api-public.guidebox.com/v1.43/US/#{Rails.application.secrets[:guidebox_api_key]}/movies/all/50/25/all/all")
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
