require "test_helper"

class CustomSearchControllerTest < ActionDispatch::IntegrationTest
  test "should get find_user_with_profile_title" do
    get custom_search_find_user_with_profile_title_url
    assert_response :success
  end
end
