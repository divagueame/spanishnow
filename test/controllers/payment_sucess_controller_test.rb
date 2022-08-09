require "test_helper"

class PaymentSucessControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get payment_sucess_index_url
    assert_response :success
  end
end
