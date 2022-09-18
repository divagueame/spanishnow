require "test_helper"

class MultipleOpenPiecesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @multiple_open_piece = multiple_open_pieces(:one)
  end

  test "should get index" do
    get multiple_open_pieces_url
    assert_response :success
  end

  test "should get new" do
    get new_multiple_open_piece_url
    assert_response :success
  end

  test "should create multiple_open_piece" do
    assert_difference("MultipleOpenPiece.count") do
      post multiple_open_pieces_url, params: { multiple_open_piece: { full: @multiple_open_piece.full, hint: @multiple_open_piece.hint, multiple_open_input_block_id: @multiple_open_piece.multiple_open_input_block_id, shown: @multiple_open_piece.shown } }
    end

    assert_redirected_to multiple_open_piece_url(MultipleOpenPiece.last)
  end

  test "should show multiple_open_piece" do
    get multiple_open_piece_url(@multiple_open_piece)
    assert_response :success
  end

  test "should get edit" do
    get edit_multiple_open_piece_url(@multiple_open_piece)
    assert_response :success
  end

  test "should update multiple_open_piece" do
    patch multiple_open_piece_url(@multiple_open_piece), params: { multiple_open_piece: { full: @multiple_open_piece.full, hint: @multiple_open_piece.hint, multiple_open_input_block_id: @multiple_open_piece.multiple_open_input_block_id, shown: @multiple_open_piece.shown } }
    assert_redirected_to multiple_open_piece_url(@multiple_open_piece)
  end

  test "should destroy multiple_open_piece" do
    assert_difference("MultipleOpenPiece.count", -1) do
      delete multiple_open_piece_url(@multiple_open_piece)
    end

    assert_redirected_to multiple_open_pieces_url
  end
end
