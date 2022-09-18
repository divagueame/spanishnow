require "application_system_test_case"

class MultipleOpenPiecesTest < ApplicationSystemTestCase
  setup do
    @multiple_open_piece = multiple_open_pieces(:one)
  end

  test "visiting the index" do
    visit multiple_open_pieces_url
    assert_selector "h1", text: "Multiple open pieces"
  end

  test "should create multiple open piece" do
    visit multiple_open_pieces_url
    click_on "New multiple open piece"

    fill_in "Full", with: @multiple_open_piece.full
    fill_in "Hint", with: @multiple_open_piece.hint
    fill_in "Multiple open input block", with: @multiple_open_piece.multiple_open_input_block_id
    fill_in "Shown", with: @multiple_open_piece.shown
    click_on "Create Multiple open piece"

    assert_text "Multiple open piece was successfully created"
    click_on "Back"
  end

  test "should update Multiple open piece" do
    visit multiple_open_piece_url(@multiple_open_piece)
    click_on "Edit this multiple open piece", match: :first

    fill_in "Full", with: @multiple_open_piece.full
    fill_in "Hint", with: @multiple_open_piece.hint
    fill_in "Multiple open input block", with: @multiple_open_piece.multiple_open_input_block_id
    fill_in "Shown", with: @multiple_open_piece.shown
    click_on "Update Multiple open piece"

    assert_text "Multiple open piece was successfully updated"
    click_on "Back"
  end

  test "should destroy Multiple open piece" do
    visit multiple_open_piece_url(@multiple_open_piece)
    click_on "Destroy this multiple open piece", match: :first

    assert_text "Multiple open piece was successfully destroyed"
  end
end
