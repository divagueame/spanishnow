require "test_helper"

class LessonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lesson = lessons(:one)
    @lessons = Lesson.all
    @lonely_lesson_groups = LessonGroup.where(lesson_id: nil)
    @logged_out_user = users(:one)
    @logged_in_user = users(:two)
    @admin_user = users(:three)
    @course = courses(:one)
  end


  test "should get new if admin" do
    sign_in(@admin_user)

    get new_lesson_url(course_id: @course.id)
    assert_response :success
  end

  test "should not get new if regular user" do
    sign_in(@logged_in_user)
    get new_lesson_url
    assert_redirected_to root_path
  end

  test "should create lesson if admin" do
    sign_in(@admin_user)
    assert_difference("Lesson.count") do
      post lessons_url, params: { lesson: { description: @lesson.description, product_id: @lesson.product_id, title: @lesson.title} }
    end

    assert_redirected_to lesson_url(Lesson.last)
  end

  test "should not create lesson if not admin" do
    sign_in(@logged_in_user)
    assert_no_difference("Lesson.count") do
      post lessons_url, params: { lesson: { description: @lesson.description,  product_id: @lesson.product_id, title: @lesson.title } }
    end

    assert_redirected_to root_path
  end

  test "should show lesson with the right lesson group" do
    @has_active_study_sesion_user = users(:has_active_study_session)
    sign_in(@has_active_study_sesion_user)
    @active_lesson_group = LessonGroup.find(@has_active_study_sesion_user.study_session.lesson_group_id)

    assert_not_nil @has_active_study_sesion_user.study_session
    
    get lesson_url(@lesson)
    assert_response :success
    assert_equal "You have about 1 hour left to complete this lesson.", flash[:notice]
    assert_equal @active_lesson_group.position, 1
    
  end

  test "should directed to right lesson if user has active study session but asks for the wrong lesson" do
#   @active_study_session_user = users(:has_active_study_session)
#   @lesson_two = lessons(:two)
#   sign_in(@active_study_session_user)

#   get lesson_url(@lesson_two)
#   assert_redirected_to lesson_url(@lesson)
#   assert_equal "Please, continue with your lesson. You still have about 1 hour left", flash[:notice] 
#   
#   travel 3.hours
#   get lesson_url(@lesson_two)
#   assert_response :success
#   assert_equal "Please, continue with your lesson. You still have about 1 hour left", flash[:notice] 

#   get lesson_url(@lesson)
#   assert_redirected_to lesson_url(@lesson_two)
#   assert_equal "Please, continue with your lesson. You still have 30 minutes left", flash[:notice] 
    
  end

  test "should not show lesson if logged out" do
    get lesson_url(@lesson)
    assert_redirected_to new_user_session_path
  end

  test "should get edit if admin" do
    sign_in(@admin_user)
    get edit_lesson_url(@lesson)
    assert_response :success
  end

  test "should not get edit if logged in" do
    sign_in(@logged_in_user)
    get edit_lesson_url(@lesson)
    assert_redirected_to root_path
  end

  test "should update lesson if admin" do
    sign_in(@admin_user)
    patch lesson_url(@lesson), params: { lesson: { description: @lesson.description, product_id: @lesson.product_id, title: @lesson.title } }
    assert_redirected_to lesson_url(@lesson)
  end

  test "should not update lesson if logged out" do
    patch lesson_url(@lesson), params: { lesson: { description: @lesson.description, product_id: @lesson.product_id, title: @lesson.title } }
    assert_redirected_to root_path
  end

  test "should destroy lesson if admin" do
    sign_in(@admin_user)
    assert_difference("Lesson.count", -1) do
      delete lesson_url(@lesson)
    end

    assert_redirected_to course_url(@lesson.course_id)
  end

  test "should not destroy lesson if logged in" do
    sign_in(@logged_in_user)
    assert_difference("Lesson.count", 0) do
      delete lesson_url(@lesson)
    end

    assert_redirected_to root_path
  end
end
