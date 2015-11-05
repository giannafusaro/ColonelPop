class ReviewsController < ApplicationController
  before_filter :get_movie

  def new
    @review = Review.new
  end

  def create
    @review = Review.create post_params
    @title = params[:title]
    if @review.save
      flash[:notice] = "You've successfully created a review."
      redirect_to root_path
    else
      render :new
    end
  end

  def show

  end

  private

    def get_movie
      @movie = Rails.cache.fetch("movie:#{params[:movie_id]}") do
        uri = URI("#{ENDPOINT}/movie/#{params[:movie_id]}")
        JSON.parse(Net::HTTP.get(uri))
      end
    end

    def post_params
      params.require(:review).permit(:rating, :email, :comment, :movie_id)
    end
end
