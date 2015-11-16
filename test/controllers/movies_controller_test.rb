require 'test_helper'

class MoviesControllerTest < ActionController::TestCase

  test "get index" do
    get :index
    assert_response :success
    assert_select 'tbody tr', count: 5
  end

  test "show a movie with a couple reviews" do
    get :show, id: 1
    assert_response :success
    assert_select 'article', count: 2
  end

  test "show a movie that has no reviews" do
    get :show, id: 2
    assert_response :success
    assert_select 'article', count: 1
  end
end
