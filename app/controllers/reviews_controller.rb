class ReviewsController < ApplicationController
  before_filter :get_movie, except: :index

  def index
    @reviews = Review.all
  end

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

  private

    def post_params
      params.require(:review).permit(:rating, :email, :comment, :movie_id)
    end
end
