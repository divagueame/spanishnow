require "test_helper"

class CheckoutControllerTest < ActionDispatch::IntegrationTest
  test "should get root as home#index" do
    @product = products(:one)
    post checkout_create_path,
    params: { id: @product.id }
    assert_response :redirect
    # follow_redirect!
  end

end
