require "test_helper"

class LessonGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lesson_group = lesson_groups(:one)
    @admin = users(:three)
    @logged_in_user = users(:two)
    @lesson = lessons(:one)
  end

  # test "should get index" do
  #   get lesson_groups_url
  #   assert_response :success
  # end

  # test "should get new" do
  #   get new_lesson_group_url
  #   assert_response :success
  # end

  test "should create lesson_group if admin" do
    sign_in(@admin)
    assert_difference("LessonGroup.count") do
      post lesson_groups_url, params: { lesson_group: 
                                        {
                                          description: 'Description of new lesson group',
                                          lesson_id: '',
                                          title: "Amazing new title" 
                                        }
                                    }
    end

    assert_redirected_to lesson_group_url(LessonGroup.last)
  end

  # test "should show lesson_group if logged in" do
  #   sign_in(@logged_in_user)
  #   get lesson_group_url(@lesson_group)
  #   assert_response :success
  # end



  # test "should not show lesson_group if logged out" do
  #   get lesson_group_url(@lesson_group)
  #   assert_redirected_to new_user_session_path
  # end

  # test "should get edit if admin" do
  #   sign_in(@admin)
  #   get edit_lesson_group_url(@lesson_group)
  #   assert_response :success
  # end

  # test "should not get edit if regular user" do
  #   sign_in(@logged_in_user)
  #   get edit_lesson_group_url(@lesson_group)
  #   assert_redirected_to root_path
  # end

  # test "should update lesson_group if admin" do
  #   sign_in(@admin)
  #   patch lesson_group_url(@lesson_group), params: { lesson_group: { description: @lesson_group.description, lesson_id: @lesson_group.lesson_id, position: @lesson_group.position, title: @lesson_group.title } }
  #   assert_redirected_to lesson_group_url(@lesson_group)
  # end

  # test "should not update lesson_group if regular user" do
  #   sign_in(@logged_in_user)
  #   patch lesson_group_url(@lesson_group), params: { lesson_group: { description: @lesson_group.description, lesson_id: @lesson_group.lesson_id, position: @lesson_group.position, title: @lesson_group.title } }
  #   assert_redirected_to root_path
  # end

  # test "should destroy lesson_group if admin" do
  #   sign_in(@admin)
  #   assert_difference("LessonGroup.count", -1) do
  #     delete lesson_group_url(@lesson_group)
  #   end

  #   assert_redirected_to lesson_groups_url
  # end


  # test "should not destroy lesson_group if admin" do
  #   sign_in(@logged_in_user)
  #   assert_difference("LessonGroup.count", 0) do
  #     delete lesson_group_url(@lesson_group)
  #   end
  #   assert_redirected_to root_path
  # end
end
