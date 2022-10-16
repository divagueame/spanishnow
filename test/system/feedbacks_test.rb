require "application_system_test_case"

class FeedbacksTest < ApplicationSystemTestCase
  setup do
    @feedback = feedbacks(:one)
    # @logged_out_user = users(:one)
    @logged_in_user = users(:two)
    @admin_user = users(:three)
  end

  # 
  # test "visiting the index" do
  #   visit feedbacks_url
  #   assert_selector "h1", text: "Feedbacks"
  # end

  test "should create feedback if admin" do
    sign_in(@admin_user)
    visit admin_url

    assert_selector ".user_text_answers .user_text_answer h3.title", text: "Increible!"
    assert_selector ".user_text_answers .user_text_answer p.body", text: "No me puedo creer lo que veo"
    click_on "Give feedback"

    assert_selector "h1", text: "Feedback for mike@mike.com"
    fill_in "Body", with: 'Chiki chiki. You did quite well.'
    click_on "Create Feedback"

    assert_text "Feedback was successfully created"
    assert_selector "h1", text: "Admin Panel"
    assert_no_selector ".user_text_answer"
    
  end

  test "should open feedback panel" do
      sign_in(@logged_in_user)
      visit root_path
      assert_selector "#unseen_feedback"



      # assert_select "#unseen_feedback span"#, {count: 1, text: "Welcome"}

  end
  # test "should update Feedback" do
  #   visit feedback_url(@feedback)
  #   click_on "Edit this feedback", match: :first

  #   fill_in "Body", with: @feedback.body
  #   check "Seen" if @feedback.seen
  #   fill_in "User", with: @feedback.user_id
  #   fill_in "User text answer", with: @feedback.user_text_answer_id
  #   click_on "Update Feedback"

  #   assert_text "Feedback was successfully updated"
  #   click_on "Back"
  # end

  # test "should destroy Feedback" do
  #   visit feedback_url(@feedback)
  #   click_on "Destroy this feedback", match: :first

  #   assert_text "Feedback was successfully destroyed"
  # end
end
