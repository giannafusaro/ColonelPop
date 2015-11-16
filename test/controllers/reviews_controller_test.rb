require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase

  test "new review" do
    get :new, movie_id: 1
    assert_response :success

    assert assigns(:movie)
    assert assigns(:review)
    assert_select '#review_movie_id[value="1"]', 1
  end

  test "create valid review" do
    post :create, movie_id: 1, review: {
      email: "example@example.com",
      rating: "8",
      comment: "It was okay.",
      movie_id: "1"
    }
    assert_response :redirect
    assert_redirected_to root_path
  end

  test "create invalid review" do
    post :create, movie_id: 1, review: {
      email: "invalid",
      rating: "123",
      comment: "",
      movie_id: "1"
    }
    assert_response :success
    assert_select '.alert ul li', 2
  end

end
