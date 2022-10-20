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

  test "should create lesson and it should be inactive" do
    sign_in(@admin_user)
    visit lessons_url
    click_on "New lesson"

    fill_in "Description", with: @lesson.description
    # fill_in "Product", with: @lesson.product_id
    fill_in "Title", with: @lesson.title
    click_on "Create Lesson"

    assert_text "Lesson was successfully created"
    assert_text "Learning a lot of chiki chiki"
    assert_selector ".inactive-lesson"
  end

  test "should update Lesson" do
    sign_in(@admin_user)
    visit lesson_url(@lesson)

    find('.edit-lesson-btn').click
    
    fill_in "Description", with: 'Chikipun'
    fill_in "Title", with: @lesson.title
    click_on "Update Lesson"

    assert_text "Lesson was successfully updated"
    assert_text "Chikipun"
  end


  test "Logged in users should not update or destroy lesson" do
    sign_in(@logged_in_user)
    visit lesson_url(@lesson)
    assert_no_text "Edit this lesson"
    assert_no_text "Destroy this lesson"
  end

  test "should destroy Lesson" do
    sign_in(@admin_user)
    visit lessons_url
    assert_selector('#lessons', count: 1)
    assert_selector('.lesson_link', count: 3)
    
    visit lesson_url(@lesson)

    find('#destroy-lesson-btn').click
    assert_no_selector "a#destroy-lesson-btn"

    assert_text "Lesson was successfully destroyed"
    
    assert_selector('#lessons', count: 1)
    assert_selector('.lesson_link', count: 2)
  end
end
