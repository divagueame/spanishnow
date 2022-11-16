require "test_helper"

class CoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course = courses(:one)
    @lessons = @course.lessons
   
  #   @lesson = lessons(:one)
  #   @lessons = Lesson.all
  #   @lonely_lesson_blocks = LessonBlock.where(lesson_id: nil)
    @logged_in_user = users(:one)
  #   @logged_in_user = users(:two)
    @admin_user = users(:three)
  end

  test "should get course if admin" do
    sign_in(@admin_user)
    get course_url(@course)

    assert_equal(@lessons.count, 3)
    assert_response :success
  end

  test "should get course if logged in" do
    sign_in(@logged_in_user)
    get course_url(@course)

    assert_equal(@lessons.count, 3)
    assert_response :success
  end

  test "should not get course if logged out" do
    get course_url(@course)
    assert_redirected_to new_user_session_path
  end
  
  test "should show lessons of course" do
    sign_in(@admin_user)
    get course_url(@course)
    assert_response :success
    assert_equal(@lessons.count, 3)
  end

end
