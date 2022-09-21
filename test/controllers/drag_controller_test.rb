require "test_helper"

class DragControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course = courses(:one)
    @lessons = @course.lessons
    @first_lesson = lessons(:one)
    @second_lesson = lessons(:two)
    @third_lesson = lessons(:three)
    @admin_user = users(:three)
    @user_one = users(:one)
  end

  test "should update the position of the lesson" do
    sign_in(@admin_user)
    assert_equal 1, Lesson.find(@first_lesson.id).position
    assert_equal 3, Lesson.find(@third_lesson.id).position
    
    patch drag_lesson_path, params: {resource:
                                      { id: @first_lesson.id,  position: 2 }
                                    }
  
    assert_response :success
    assert_equal 3, Lesson.find(@first_lesson.id).position
    assert_equal 2, Lesson.find(@third_lesson.id).position
  end

  test "regular users should not update the position of the lesson" do
    sign_in(@user_one)
    assert_equal 1, Lesson.find(@first_lesson.id).position
    assert_equal 3, Lesson.find(@third_lesson.id).position
    
    patch drag_lesson_path, params: {resource:
                                      { id: @first_lesson.id,  position: 2 }
                                    }
  
    assert_redirected_to root_path
    assert_equal 1, Lesson.find(@first_lesson.id).position
    assert_equal 3, Lesson.find(@third_lesson.id).position
  end

  # test "should redirect to root if logged out" do
  #   get lessons_url
  #   assert_redirected_to new_user_session_path
  # end

  # test "should get new if admin" do
  #   sign_in(@admin_user)
  #   get new_lesson_url
  #   assert_response :success
  # end

  # test "should not get new if regular user" do
  #   sign_in(@logged_in_user)
  #   get new_lesson_url
  #   assert_redirected_to root_path
  # end

  # test "should create lesson if admin" do
  #   sign_in(@admin_user)
  #   assert_difference("Lesson.count") do
  #     post lessons_url, params: { lesson: { description: @lesson.description, product_id: @lesson.product_id, title: @lesson.title } }
  #   end

  #   assert_redirected_to lesson_url(Lesson.last)
  # end

  # test "should not create lesson if not admin" do
  #   sign_in(@logged_in_user)
  #   assert_no_difference("Lesson.count") do
  #     post lessons_url, params: { lesson: { description: @lesson.description,  product_id: @lesson.product_id, title: @lesson.title } }
  #   end

  #   assert_redirected_to root_path
  # end

  # test "should show lesson to logged in users" do
  #   sign_in(@logged_in_user)
  #   get lesson_url(@lesson)
  #   assert_response :success
  # end

  # test "should not show lesson if logged out" do
  #   get lesson_url(@lesson)
  #   assert_redirected_to new_user_session_path
  # end

  # test "should get edit if admin" do
  #   sign_in(@admin_user)
  #   get edit_lesson_url(@lesson)
  #   assert_response :success
  # end

  # test "should not get edit if logged in" do
  #   sign_in(@logged_in_user)
  #   get edit_lesson_url(@lesson)
  #   assert_redirected_to root_path
  # end

  # test "should update lesson if admin" do
  #   sign_in(@admin_user)
  #   patch lesson_url(@lesson), params: { lesson: { description: @lesson.description, product_id: @lesson.product_id, title: @lesson.title } }
  #   assert_redirected_to lesson_url(@lesson)
  # end

  # test "should not update lesson if logged out" do
  #   patch lesson_url(@lesson), params: { lesson: { description: @lesson.description, product_id: @lesson.product_id, title: @lesson.title } }
  #   assert_redirected_to root_path
  # end

  # test "should destroy lesson if admin" do
  #   sign_in(@admin_user)
  #   assert_difference("Lesson.count", -1) do
  #     delete lesson_url(@lesson)
  #   end

  #   assert_redirected_to lessons_url
  # end

  # test "should not destroy lesson if logged in" do
  #   sign_in(@logged_in_user)
  #   assert_difference("Lesson.count", 0) do
  #     delete lesson_url(@lesson)
  #   end

  #   assert_redirected_to root_path
  # end
end
