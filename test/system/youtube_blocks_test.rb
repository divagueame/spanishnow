require "application_system_test_case"

class YoutubeBlocksTest < ApplicationSystemTestCase
  setup do
    @youtube_block = youtube_blocks(:one)
    @lesson_group = lesson_groups(:one)
    @admin_user = users(:three)
  end

  test "should create youtube block" do
    sign_in(@admin_user)
    visit lesson_group(@lesson_group) 
    click_on "New youtube block"

    fill_in "Code", with: @youtube_block.code
    fill_in "Url", with: @youtube_block.url
    click_on "Create Youtube block"

    assert_text "Youtube block was successfully created"
    click_on "Back"
  end

  test "should update Youtube block" do
    visit youtube_block_url(@youtube_block)
    click_on "Edit this youtube block", match: :first

    fill_in "Code", with: @youtube_block.code
    fill_in "Url", with: @youtube_block.url
    click_on "Update Youtube block"

    assert_text "Youtube block was successfully updated"
    click_on "Back"
  end

  test "should destroy Youtube block" do
    visit youtube_block_url(@youtube_block)
    click_on "Destroy this youtube block", match: :first

    assert_text "Youtube block was successfully destroyed"
  end
end
