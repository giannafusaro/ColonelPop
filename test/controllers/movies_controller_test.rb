require 'test_helper'

class MoviesControllerTest < ActionController::TestCase

  test "get index" do
    get :index
    assert_response :success
    assert_select 'tbody tr', count: 15
  end

  test "get show" do
    get :show, id: 9627
    assert_response :success
    assert_select 'article', count: 2
  end
end
