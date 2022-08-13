require "test_helper"

class PaymentSucessControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get welcome_url
    
    assert_select "h1", text: "Purchase Completed"
    assert_response :success
  end
end