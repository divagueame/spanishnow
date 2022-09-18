require "test_helper"

class MultipleOpenBlocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    # @multiple_open_block = multiple_open_blocks(:one)
    @lesson = lessons(:one)
    @admin_user = users(:three)
    @not_admin = users(:one) 
  end

  # test "should not get index" do
  #   get multiple_open_blocks_url
  #   assert_redirected_to root_path
  # end

  test "should get new and initialize a lesson block" do
    sign_in(@admin_user)
    get new_multiple_open_block_url, params: { lesson_id: @lesson.id}
    assert_response :success
  end

  test "should create multiple_open_block, the associated lesson_block and two associated pieces" do
    sign_in(@admin_user)
    @multiple_open_block = MultipleOpenBlock.new(body: 'Chikibody', title: 'Chikititle')

    assert_difference("MultipleOpenBlock.count") do
      assert_difference("LessonBlock.count") do
        assert_difference("MultipleOpenPiece.count", 2) do
          post multiple_open_blocks_url,
            params:
              { multiple_open_block:
                {
                  body: @multiple_open_block.body,
                  title: @multiple_open_block.title,
                  lesson_block_attributes: { title: "LessonBlockTitle", lesson_id: @lesson.id},
                  multiple_open_pieces_attributes: [
                  {"full"=>"asdf", "shown"=>"asdf", "hint"=>"asd"}, 
                  {"full"=>"adsfsd", "shown"=>"asd", "hint"=>""},
                  {"full"=>"", "shown"=>"", "hint"=>""}
                  ]
                }
              }
        end
      end
    end
    assert_redirected_to lesson_path(MultipleOpenBlock.last.lesson)
  end

  # test "should show multiple_open_block" do
  #   get multiple_open_block_url(@multiple_open_block)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_multiple_open_block_url(@multiple_open_block)
  #   assert_response :success
  # end

  # test "should update multiple_open_block" do
  #   patch multiple_open_block_url(@multiple_open_block), params: { multiple_open_block: { body: @multiple_open_block.body, title: @multiple_open_block.title } }
  #   assert_redirected_to multiple_open_block_url(@multiple_open_block)
  # end

  # test "should destroy multiple_open_block" do
  #   assert_difference("MultipleOpenBlock.count", -1) do
  #     delete multiple_open_block_url(@multiple_open_block)
  #   end

  #   assert_redirected_to multiple_open_blocks_url
  # end
end
