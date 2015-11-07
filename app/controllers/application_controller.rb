class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  ENDPOINT = "https://api-public.guidebox.com/v1.43/US/#{Rails.application.secrets[:guidebox_api_key]}"
  PER_PAGE = 15

  def get_movie(review=nil)
    id = review ? review.movie_id : params[:movie_id]
    movie = Rails.cache.fetch("movie:#{id}") do
      uri = URI("#{ENDPOINT}/movie/#{id}")
      JSON.parse(Net::HTTP.get(uri))
    end
    @background = movie["poster_400x570"]
    @movie = movie
  end
  helper_method :get_movie

end
