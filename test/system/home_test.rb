require "application_system_test_case"

class HomeTest < ApplicationSystemTestCase

  test "visiting the index" do
    visit root_url
    assert_selector "img", class: "logo"
  end

  test "buying the product" do
    visit root_url
    assert_selector "img", class: "logo"
    # assert_selector "button", text: "Buy now and start learning today!"
    # click_button
  end
end
