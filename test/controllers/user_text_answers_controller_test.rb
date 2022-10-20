require "test_helper"

class UserTextAnswersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_text_answer = user_text_answers(:one)
    @user_text_block = user_text_blocks(:first_user_text_block)
    @right_user = users(:one) 
    @wrong_user = users(:two) 
  end


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
    assert_redirected_to new_user_session_path
  end  

  test "should create user_text_answer" do
    sign_in(@wrong_user)
    @second_user_text_block = user_text_blocks(:second_user_text_block)
    assert_difference("UserTextAnswer.count") do
      post user_text_block_user_text_answers_path(@second_user_text_block),
      params: {  user_text_answer: {  body: 'sdf',
                                      title: 'asdfsd',
                                      user_id: @wrong_user.id,
                                      user_text_block_id: @second_user_text_block.id } }
    end
    
    assert_redirected_to lesson_path(@second_user_text_block.lesson_group.lesson)

    assert_equal "Genial! Buen trabajo.", flash[:notice] 
  end

  test "should not create user_text_answer if user already has one answer" do
    sign_in(@right_user)  
    assert_no_difference("UserTextAnswer.count") do
      post user_text_block_user_text_answers_path(@user_text_block),
      params: {  user_text_answer: {  body: 'sdf',
                                      title: 'asdfsd',
                                      user_id: @right_user.id,
                                      user_text_block_id: @user_text_block.id } }
    end
    assert_template :new
  end

  test "should not create user_text_answer if not logged in" do
     
    assert_no_difference("UserTextAnswer.count") do
      post user_text_block_user_text_answers_path(@user_text_block),
      params: {  user_text_answer: {  body: 'sdf',
                                      title: 'asdfsd',
                                      user_id: users(:one).id,
                                      user_text_block_id: @user_text_block.id } }
    end
    assert_redirected_to new_user_session_path
    # assert_redirected_to root_path
    # assert_equal "Are you chiki chiki?", flash[:notice] 
  end

  # test "should get edit" do
  #   get edit_user_text_answer_url(@user_text_answer)
  #   assert_response :success
  # end

  # test "should update user_text_answer" do
  #   patch user_text_answer_url(@user_text_answer), params: { user_text_answer: { body: @user_text_answer.body, title: @user_text_answer.title, user_id: @user_text_answer.user_id } }
  #   assert_redirected_to user_text_answer_url(@user_text_answer)
  # end

 
end
