module MoviesHelper

  def number_of_reviews(movie_id)
    Review.where(movie_id: movie_id).count
  end

end
