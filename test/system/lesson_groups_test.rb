require "application_system_test_case"

class LessonGroupsTest < ApplicationSystemTestCase

 

  setup do
    @lesson = lessons(:one)
    @lesson_group = lesson_groups(:one)
    @logged_out_user = users(:one)
    @logged_in_user = users(:two)
    @admin_user = users(:three)
  end

 


  test "should create lesson group with lesson_id" do
    sign_in(@admin_user) 
    visit lesson_path(@lesson)
    assert_text "Yo soy alucinante"

    within '#add-lesson-group-btn' do
        find("span").assert_text("1")
    end
    find("#add-lesson-group-btn").click

    fill_in "Description", with: 'Yipi description'
    fill_in "Title", with: 'New title on lesson group'
    click_on "Create Lesson group"

    assert_text "Lesson group was successfully created"
    assert_text 'New title on lesson group'
    assert_text "Yo soy alucinante"

    within '#add-lesson-group-btn' do
        find("span").assert_text("2")
    end
  end

  # test "should update Lesson group" do
  #   visit lesson_group_url(@lesson_group)
  #   click_on "Edit this lesson group", match: :first

  #   fill_in "Description", with: @lesson_group.description
  #   fill_in "Lesson", with: @lesson_group.lesson_id
  #   fill_in "Position", with: @lesson_group.position
  #   fill_in "Title", with: @lesson_group.title
  #   click_on "Update Lesson group"

  #   assert_text "Lesson group was successfully updated"
  #   click_on "Back"
  # end

  # test "should destroy Lesson group" do
  #   visit lesson_group_url(@lesson_group)
  #   click_on "Destroy this lesson group", match: :first

  #   assert_text "Lesson group was successfully destroyed"
  # end
end
