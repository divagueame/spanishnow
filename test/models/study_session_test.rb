require "test_helper"

class StudySessionTest < ActiveSupport::TestCase

  setup do
    @lesson = lessons(:one)
    @user_one = users(:one)
    
    @lesson_with_target_time = lessons(:two)
  end
  
end
