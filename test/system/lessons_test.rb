require "application_system_test_case"

class LessonsTest < ApplicationSystemTestCase
  setup do
    @lesson = lessons(:one)
    @logged_out_user = users(:one)
    @logged_in_user = users(:two)
    @admin_user = users(:three)
  end

  test "visiting the index" do
    sign_in(@logged_in_user)
    visit lessons_url
    assert_selector "h1", text: "Lessons"
  end

  test "should create lesson" do
    sign_in(@admin_user)
    visit lessons_url
    click_on "New lesson"

    fill_in "Description", with: @lesson.description
    fill_in "Product", with: @lesson.product_id
    fill_in "Title", with: @lesson.title
    click_on "Create Lesson"

    assert_text "Lesson was successfully created"
    click_on "Back"
  end

  test "should update Lesson" do
    sign_in(@admin_user)
    visit lesson_url(@lesson)
    click_on "Edit this lesson", match: :first

    fill_in "Description", with: @lesson.description
    fill_in "Product", with: @lesson.product_id
    fill_in "Title", with: @lesson.title
    click_on "Update Lesson"

    assert_text "Lesson was successfully updated"
    click_on "Back"
  end


  test "Logged in users should not update or destroy lesson" do
    sign_in(@logged_in_user)
    visit lesson_url(@lesson)
    assert_no_text "Edit this lesson"
    assert_no_text "Destroy this lesson"
  end

  test "should destroy Lesson" do
    sign_in(@admin_user)
    visit lesson_url(@lesson)
    click_on "Destroy this lesson", match: :first

    assert_text "Lesson was successfully destroyed"
  end
end
