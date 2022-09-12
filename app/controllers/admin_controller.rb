class AdminController < ApplicationController
  before_action :authenticate_admin
  
  def index
    @user_text_answers = UserTextAnswer.all
  end

end
