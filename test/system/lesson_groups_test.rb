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
#   sign_in(@admin_user) 
#   visit lesson_path(@lesson)
#   assert_text "Yo soy alucinante"

#   within '#add-lesson-group-btn' do
#       find("span").assert_text("3")
#   end
#   find("#add-lesson-group-btn").click

#   fill_in "Description", with: 'Yipi description'
#   fill_in "Title", with: 'New title on lesson group'
#   click_on "Create Lesson group"

#   assert_text "Lesson group was successfully created"
#   assert_text 'New title on lesson group'
#   assert_text "Yo soy alucinante"

#   within '#add-lesson-group-btn' do
#       find("span").assert_text("4")
#   end
  end

  test "should update Lesson group" do
#   sign_in(@admin_user) 
#   visit lesson_url(@lesson_group.lesson)
#   assert_no_text 'New Chikititle'
#   assert_text @lesson_group.title
#   first(".icons-more").click
#   click_on "Edit lesson group"#, match: :first

#   fill_in "Description", with: @lesson_group.description
#   fill_in "Title", with: 'New Chikititle'
#   click_on "Update Lesson group"

#   assert_text "Lesson group was successfully updated"
#   assert_text 'New Chikititle'
#   assert_no_text @lesson_group.title
  end

  test "should destroy Lesson group" do
#   sign_in(@admin_user)

#   visit lesson_url(@lesson_group.lesson)
#   assert_text @lesson_group.title

#   first(".icons-more").click
#   click_on "Delete Lesson Group"#, match: :first

#   assert_no_text @lesson_group.title
#   assert_text "Lesson group was successfully destroyed"
  end
end
