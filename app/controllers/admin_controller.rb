class AdminController < ApplicationController
  before_action :authenticate_admin
  
  def index
    @user_text_answers = UserTextAnswer.all.left_joins(:feedback).where(feedback: {id: nil})
    @feedbacks = Feedback.all
    @students = User.all
  end

end
