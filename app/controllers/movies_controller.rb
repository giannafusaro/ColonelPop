class MoviesController < ApplicationController
  def index
     @movies = Rails.cache.fetch("movies:all") do
       uri = URI('https://api-public.guidebox.com/v1.43/US/hPgyoPrny58MGATuDMFQVn0MoKzMdD/movies/all/50/25/all/all')
       response = JSON.parse(Net::HTTP.get(uri))
       response["results"]
     end
  end
end
