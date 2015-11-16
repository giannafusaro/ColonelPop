require 'test_helper'

class ReviewTest < ActiveSupport::TestCase

  test "must have valid email" do
    @review = Review.new(movie_id: 35899, email: "invalid_email.com", rating: "7", comment: "Example comment." )
    assert_not @review.save, "#{@review.email} should not be a valid email."
  end

  test "rating must be between 1 and 10" do
    @review = Review.new(movie_id: 35899, email: "valid_email@valid.com", rating: "0", comment: "Example comment." )
    assert_not @review.save, "#{@review.rating} should not be a valid rating."
  end

  test "review must have valid data" do
    @review = Review.new(movie_id: 35899, email: "valid_email@valid.com", rating: "8", comment: "Example comment." )
    assert @review.save, "#{@review.inspect} should save successfully."
  end
end
