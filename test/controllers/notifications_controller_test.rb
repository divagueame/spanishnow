require "test_helper"

class NotificationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    @logged_in_user = users(:one)
    sign_in(@logged_in_user)
    get notifications_url
    assert_response :success
  end
end
