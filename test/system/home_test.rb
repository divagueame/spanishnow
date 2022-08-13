require "application_system_test_case"

class HomeTest < ApplicationSystemTestCase

  test "visiting the index" do
    visit root_url
    assert_selector "h1", text: "Mambo Spanish"
  end

  test "buying the product" do
    visit root_url
    assert_selector "h1", text: "Mambo Spanish"
    assert_selector "button", text: "Buy now and start learning today!"
    click_button
  end
end
