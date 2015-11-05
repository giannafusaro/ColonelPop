class ReviewsController < ApplicationController
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
      flash[:notice] = "Something went wrong."
      render :new
    end
  end

  def show

  end

  private
    def post_params
      params.require(:review).permit(:rating, :email, :comment, :movie_id)
    end
end
