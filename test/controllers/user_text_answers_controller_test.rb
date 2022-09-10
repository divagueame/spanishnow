require "test_helper"

class UserTextAnswersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_text_answer = user_text_answers(:one)
    @user_text_block = user_text_blocks(:first_user_text_block)
    @right_user = users(:one) 
    @wrong_user = users(:two) 
  end

  # test "should get index" do
  #   get user_text_answers_url
  #   assert_response :success
  # end

  test "should get edit if right user" do
    sign_in(@right_user)
    get edit_user_text_block_user_text_answer_url(@user_text_block, @user_text_answer)
    assert_response :success
  end


  test "should not get edit if wrong user" do
    sign_in(@wrong_user)
    get edit_user_text_block_user_text_answer_url(@user_text_block, @user_text_answer)
    assert_redirected_to root_url
  end

  test "should not get edit if logged out" do
    get edit_user_text_block_user_text_answer_url(@user_text_block, @user_text_answer)
    assert_redirected_to root_url
  end  

  # test "should create user_text_answer" do
  #   assert_difference("UserTextAnswer.count") do
  #     post user_text_answers_url, params: { user_text_answer: { body: @user_text_answer.body, title: @user_text_answer.title, user_id: @user_text_answer.user_id } }
  #   end

  #   assert_redirected_to user_text_answer_url(UserTextAnswer.last)
  # end

  # test "should show user_text_answer" do
  #   get user_text_answer_url(@user_text_answer)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_user_text_answer_url(@user_text_answer)
  #   assert_response :success
  # end

  # test "should update user_text_answer" do
  #   patch user_text_answer_url(@user_text_answer), params: { user_text_answer: { body: @user_text_answer.body, title: @user_text_answer.title, user_id: @user_text_answer.user_id } }
  #   assert_redirected_to user_text_answer_url(@user_text_answer)
  # end

  # test "should destroy user_text_answer" do
  #   assert_difference("UserTextAnswer.count", -1) do
  #     delete user_text_answer_url(@user_text_answer)
  #   end

  #   assert_redirected_to user_text_answers_url
  # end
end
