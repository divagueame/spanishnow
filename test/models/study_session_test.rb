require "test_helper"

class StudySessionTest < ActiveSupport::TestCase

  setup do
    @lesson = lessons(:one)
    @user_one = users(:one)
    
    @lesson_with_target_time = lessons(:two)
  end

  test "should be return the right session expiration time of 60 minutes if lesson has not target_time set" do
    new_study_session = StudySession.new(user_id: @user_one.id, lesson_id: @lesson.id)
    assert new_study_session.valid?

    new_study_session = new_study_session.save
    assert_not StudySession.first.session_ended?

    travel 10.minutes
    assert_not StudySession.first.session_ended?

    travel 31.minutes
    assert_not StudySession.first.session_ended?


    travel 51.minutes
    assert StudySession.first.session_ended?
    
  end


  test "should be return the right session expiration time of the lesson target_time" do
    
    new_study_session = StudySession.new(user_id: @user_one.id, lesson_id: @lesson_with_target_time.id)
    assert new_study_session.valid?

    new_study_session.save
    study_session = StudySession.find_by(user_id: @user_one.id)
    
    assert_not study_session.session_ended?

    travel 10.minutes
    assert_not study_session.session_ended?
    
    travel 10.minutes
    assert_not study_session.session_ended?
    
    travel 5.minutes
    assert_not study_session.session_ended?

    travel 6.minutes
    assert study_session.session_ended?
    
  end

end
