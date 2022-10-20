require "application_system_test_case"

class LessonGroupsTest < ApplicationSystemTestCase
  setup do
    @lesson_group = lesson_groups(:one)
  end

  test "visiting the index" do
    visit lesson_groups_url
    assert_selector "h1", text: "Lesson groups"
  end

  test "should create lesson group" do
    visit lesson_groups_url
    click_on "New lesson group"

    fill_in "Description", with: @lesson_group.description
    fill_in "Lesson", with: @lesson_group.lesson_id
    fill_in "Position", with: @lesson_group.position
    fill_in "Title", with: @lesson_group.title
    click_on "Create Lesson group"

    assert_text "Lesson group was successfully created"
    click_on "Back"
  end

  test "should update Lesson group" do
    visit lesson_group_url(@lesson_group)
    click_on "Edit this lesson group", match: :first

    fill_in "Description", with: @lesson_group.description
    fill_in "Lesson", with: @lesson_group.lesson_id
    fill_in "Position", with: @lesson_group.position
    fill_in "Title", with: @lesson_group.title
    click_on "Update Lesson group"

    assert_text "Lesson group was successfully updated"
    click_on "Back"
  end

  test "should destroy Lesson group" do
    visit lesson_group_url(@lesson_group)
    click_on "Destroy this lesson group", match: :first

    assert_text "Lesson group was successfully destroyed"
  end
end
