require "test_helper"

class LessonBlocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lesson = lessons(:one)
    @lesson_group = lesson_groups(:one)
    @lesson_block = lesson_blocks(:one)
    @lesson_block_2 = lesson_blocks(:two)
    # @lessons = Lesson.all
    # @lonely_lesson_blocks = LessonBlock.where(lesson_id: nil)
    # @logged_out_user = users(:one)
    # @logged_in_user = users(:two)
    @admin_user = users(:three)
  end

  test "should delete lesson block" do
    sign_in(@admin_user)

    assert_difference("LessonBlock.count", -1) do
      assert_difference("RichBlock.count", -1) do
        delete lesson_block_url(@lesson_block)
      end
    end

    assert_redirected_to lesson_group_url(@lesson_group)
    assert_equal "Lesson block has been removed entirely.", flash[:notice] 
  end

  test "should remove link to lesson group" do
    sign_in(@admin_user)
    previous_lesson_blocks = @lesson_group.lesson_blocks.count

    assert_difference("LessonBlock.count", 0) do
      assert_difference("RichBlock.count", 0) do
          delete unlink_url(@lesson_block)
      end
    end

    # after_lesson_blocks = @lesson_group.lesson_blocks.count
    # assert_equal after_lesson_blocks + 1, previous_lesson_blocks

    # assert_redirected_to lesson_group_url(@lesson_group)
    # assert_equal "Lesson block has been unlinked from the lesson group.", flash[:notice] 
  end









  # test "should show lonely blocks if admin" do
  #   sign_in(@admin_user)
  #   get lesson_groups_url
  #   assert_response :success
    # assert_equal(@lessons.count, 3)
    # assert_equal(@lonely_lesson_blocks.count, 1)
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
