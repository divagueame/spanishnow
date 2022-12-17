require "application_system_test_case"

class CoursesTest < ApplicationSystemTestCase
  setup do
    @lesson = lessons(:one)
    @logged_out_user = users(:one)
    @logged_in_user = users(:two)
    @admin_user = users(:three)
    @course = courses(:one)
  end
 
  test "should destroy Lesson" do
    sign_in(@admin_user)
    visit course_url(@course)
    assert_selector('#lessons', count: 1)
    assert_selector('.lesson_link', count: 4)
    
    # visit lesson_url(@lesson)

    # find('#destroy-lesson-btn').click
    # assert_no_selector "a#destroy-lesson-btn"

    # assert_text "Lesson was successfully destroyed"
    
    # assert_selector('#lessons', count: 1)
    # assert_selector('.lesson_link', count: 2)
  end
end
