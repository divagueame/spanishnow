require "application_system_test_case"

class MultipleOpenAnswersTest < ApplicationSystemTestCase
  setup do
    @multiple_open_answer = multiple_open_answers(:one)
  end

  test "visiting the index" do
    visit multiple_open_answers_url
    assert_selector "h1", text: "Multiple open answers"
  end

  test "should create multiple open answer" do
    visit multiple_open_answers_url
    click_on "New multiple open answer"

    fill_in "Multiple open piece", with: @multiple_open_answer.multiple_open_piece_id
    fill_in "User answer", with: @multiple_open_answer.user_answer
    fill_in "User", with: @multiple_open_answer.user_id
    click_on "Create Multiple open answer"

    assert_text "Multiple open answer was successfully created"
    click_on "Back"
  end

  test "should update Multiple open answer" do
    visit multiple_open_answer_url(@multiple_open_answer)
    click_on "Edit this multiple open answer", match: :first

    fill_in "Multiple open piece", with: @multiple_open_answer.multiple_open_piece_id
    fill_in "User answer", with: @multiple_open_answer.user_answer
    fill_in "User", with: @multiple_open_answer.user_id
    click_on "Update Multiple open answer"

    assert_text "Multiple open answer was successfully updated"
    click_on "Back"
  end

  test "should destroy Multiple open answer" do
    visit multiple_open_answer_url(@multiple_open_answer)
    click_on "Destroy this multiple open answer", match: :first

    assert_text "Multiple open answer was successfully destroyed"
  end
end
