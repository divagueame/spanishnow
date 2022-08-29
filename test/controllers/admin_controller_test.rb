require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should redirect if user is not admin" do
    get admin_index_url
    assert_redirected_to root_url
  end
end
