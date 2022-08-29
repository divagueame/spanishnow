require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest

  test "should redirect to root if user is not logged in" do
    get admin_index_url
    assert_redirected_to root_url
  end

  test "should redirect to root if user is not admin" do
    @user = users(:one)
    sign_in(@user)
    get admin_index_url
    assert_redirected_to root_url
  end

  test "should load admin panel if user is admin" do
    @user = users(:three)
    sign_in(@user)
    get admin_index_url
    assert_response :success
  end
end
