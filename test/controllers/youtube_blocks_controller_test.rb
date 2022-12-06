require "test_helper"

class YoutubeBlocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @youtube_block = youtube_blocks(:one)
    @lesson_group = lesson_groups(:six)
    @admin_user = users(:three)
    @not_admin = users(:one)
  end

  test "should get new" do
    sign_in(@admin_user)
    get new_youtube_block_url(lesson_group_id: @lesson_group.id)
    assert_response :success
  end

  test "should create youtube_block" do
    sign_in(@admin_user)
    assert_difference("YoutubeBlock.count") do
      post youtube_blocks_url, 
        params: {
          youtube_block: { 
            code: @youtube_block.code,
            url: @youtube_block.url,  
            lesson_block_attributes: { title: "New youtube Block", lesson_group_id: @lesson_group.id}
         } }
    end

    assert_redirected_to lesson_group_path(@lesson_group)
  end

  test "should show youtube_block" do
    get youtube_block_url(@youtube_block)
    assert_response :success
  end

  test "should get edit" do
    sign_in(@admin_user)
    get edit_youtube_block_url(@youtube_block)
    assert_response :success
  end

  test "should update youtube_block" do
    sign_in(@admin_user)
    patch youtube_block_url(@youtube_block), params: { youtube_block: { code: @youtube_block.code, url: @youtube_block.url } }
    assert_redirected_to lesson_group_path(@lesson_group)
  end

  test "should destroy youtube_block" do
    sign_in(@admin_user)
    assert_difference("YoutubeBlock.count", -1) do
      delete youtube_block_url(@youtube_block)
    end

    assert_redirected_to youtube_blocks_url
  end
end
