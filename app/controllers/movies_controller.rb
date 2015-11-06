class MoviesController < ApplicationController

  def index
    @page = params[:page].to_i || 1
    limit = "#{(@page-1)*PER_PAGE > 0 ? (@page-1)*PER_PAGE : 0}/#{PER_PAGE}"
    @ckey = "movies/all/#{limit}/all/all"

    sort = params[:sort] || "none"
    @movies = Rails.cache.fetch("#{@ckey}:#{sort}") do
      uri = URI("#{ENDPOINT}/#{@ckey}")
      response = JSON.parse(Net::HTTP.get(uri))
      case sort
      when "none"         then response["results"]
      when "title"        then response["results"].sort_by{ |x| x["title"] }
      when "release_year" then response["results"].sort_by{ |x| x["release_year"] }
      when "rating"       then response["results"].sort_by{ |x| x["rating"] }
      end
    end

    @background = @movies.sample["poster_400x570"]
  end

  def show
    @movie = Rails.cache.fetch("movie:#{params[:id]}") do
      uri = URI("#{ENDPOINT}/movie/#{params[:id]}")
      JSON.parse(Net::HTTP.get(uri))
    end

    @background = @movie["poster_400x570"]
    @reviews = Review.where movie_id: params[:id]
  end

end
