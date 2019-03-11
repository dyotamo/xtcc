require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get view" do
    get search_view_url
    assert_response :success
  end

end
