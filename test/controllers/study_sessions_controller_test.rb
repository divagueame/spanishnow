require "test_helper"

class StudySessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @has_active_study_session_user = users(:has_active_study_session)
    
  end

  

  test "should update study session lesson group of current user if can go to next" do
    sign_in(@has_active_study_session_user)
    
    assert_equal(lesson_groups(:one).id, users(:has_active_study_session).study_session.lesson_group_id)
    patch study_session_update_path(format: :turbo_stream), params: { direction: 'Next' }
    assert_equal(lesson_groups(:four).id, users(:has_active_study_session).study_session.lesson_group_id)
    
  end
  
end
