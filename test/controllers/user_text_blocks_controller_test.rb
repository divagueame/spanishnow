require "test_helper"

class UserTextBlocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_text_block = user_text_blocks(:one)
    # @lesson_block = @user_text_block.lesson_block
    @admin_user = users(:three)
    @owner_user = users(:one)
    @not_owner_user = users(:two)

  end

  # test "should get index" do
  #   get user_text_blocks_url
  #   assert_response :success
  # end

  # test "should get new" do
  #   get new_user_text_block_url
  #   assert_response :success
  # end

  # test "should create user_text_block" do
  #   assert_difference("UserTextBlock.count") do
  #     post user_text_blocks_url, params: { user_text_block: { body: @user_text_block.body, promptBody: @user_text_block.promptBody, promptLength: @user_text_block.promptLength, promptTitle: @user_text_block.promptTitle, title: @user_text_block.title, user_id: @user_text_block.user_id } }
  #   end

  #   assert_redirected_to user_text_block_url(UserTextBlock.last)
  # end

  # test "should show user_text_block" do
  #   get user_text_block_url(@user_text_block)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_user_text_block_url(@user_text_block)
  #   assert_response :success
  # end

  test "should update user_text_block if admin" do
    sign_in(@admin_user)
    patch user_text_block_url(@user_text_block), params: { user_text_block: { title: 'ChikiUpdated' } }
    assert_redirected_to lesson_path(@user_text_block.lesson)
    assert_equal "ChikiUpdated", UserTextBlock.find(user_text_blocks(:one).id).title
  end

  test "should not update user_text_block if user is not owner" do
    sign_in(@not_owner_user)
    patch user_text_block_url(@user_text_block), params: { user_text_block: { title: 'ChikiUpdated' } }
    assert_redirected_to root_path
    assert_equal "OriginalTitle", UserTextBlock.find(user_text_blocks(:one).id).title
  end

  test "should update user_text_block if user is right owner" do
    sign_in(@owner_user)
    patch user_text_block_url(@user_text_block), params: { user_text_block: { title: 'ChikiUpdated' } }
    assert_redirected_to lesson_path(@user_text_block.lesson)
    assert_equal "ChikiUpdated", UserTextBlock.find(user_text_blocks(:one).id).title
  end

  # test "should destroy user_text_block and corresponding lesson_block" do
  #   assert_difference("UserTextBlock.count", -1) do
  #     delete user_text_block_url(@user_text_block)
  #   end

  #   assert_redirected_to user_text_blocks_url
  # end
end
