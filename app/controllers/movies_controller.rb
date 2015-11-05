class MoviesController < ApplicationController

  def index
    @page = params[:page].to_i || 1
    prevs = (@page-1)*PER_PAGE
    limit = "#{prevs > 0 ? prevs : 0}/#{PER_PAGE}"
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
  end

  def show
    @movie = Rails.cache.fetch("movie:#{params[:id]}") do
      uri = URI("#{ENDPOINT}/movie/#{params[:id]}")
      JSON.parse(Net::HTTP.get(uri))
    end

    @reviews = Review.where(movie_id: params[:id])

  end

end
