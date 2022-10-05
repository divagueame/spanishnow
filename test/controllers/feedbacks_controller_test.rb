require "test_helper"

class FeedbacksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @feedback = feedbacks(:one)
    @user_text_answer = user_text_answers(:three)
    @user_text_answer_already_with_feedback = user_text_answers(:one)
    @admin_user = users(:three)
    @user_one = users(:one)
    @user_two = users(:two)
  end

  test "should get new if admin" do
    sign_in(@admin_user)
    get new_feedback_url(user_text_answer_id: @user_text_answer.id)
    assert_response :success
  end

  test "should not get new if not admin" do
    sign_in(@user_two)
    get new_feedback_url(user_text_answer_id: @user_text_answer.id)
    assert_redirected_to root_path
  end

  test "should create feedback if user text answer has no feedback" do
    sign_in(@admin_user)
    assert_difference("Feedback.count") do
      post feedbacks_url(format: :turbo_stream), params: { feedback: { body: 'Venga ya', user_text_answer_id: @user_text_answer.id } }
    end
    assert_equal flash[:notice], "Feedback was successfully created"
  end

  test "should not create feedback if user text answer already has feedback" do
    sign_in(@admin_user)
    assert_difference("Feedback.count", 0) do
      post feedbacks_url(format: :turbo_stream), params: { feedback: { body: 'Venga ya', user_text_answer_id: @user_text_answer_already_with_feedback.id } }
    end
    assert_equal flash[:notice], "Feedback already exists"
  end

  test "should show feedback to owner user && should set feedback to seen" do
    sign_in(@user_one)
    assert_equal false, Feedback.find(@feedback.id).seen
    get feedback_url(@feedback)
    assert_equal true, Feedback.find(@feedback.id).seen
    assert_response :success
  end

  test "should show feedback to admin && should not update seen" do
    sign_in(@admin_user)
    assert_equal false, Feedback.find(@feedback.id).seen
    get feedback_url(@feedback.id)      
    assert_equal false, Feedback.find(@feedback.id).seen
    assert_response :success
  end


  test "should not show feedback to different user" do
    sign_in(@user_two)
    get feedback_url(@feedback.id)
    assert_redirected_to root_path
  end

  # test "should get edit" do
  #   get edit_feedback_url(@feedback)
  #   assert_response :success
  # end

  # test "should update feedback" do
  #   patch feedback_url(@feedback), params: { feedback: { body: @feedback.body, seen: @feedback.seen, user_id: @feedback.user_id, user_text_answer_id: @feedback.user_text_answer_id } }
  #   assert_redirected_to feedback_url(@feedback)
  # end

  # test "should destroy feedback" do
  #   assert_difference("Feedback.count", -1) do
  #     delete feedback_url(@feedback)
  #   end

  #   assert_redirected_to feedbacks_url
  # end
end
