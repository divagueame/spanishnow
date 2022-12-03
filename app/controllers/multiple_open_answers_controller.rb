class MultipleOpenAnswersController < ApplicationController
  before_action :authenticate_user!
#  before_action :set_multiple_open_answers, only: %i[new create edit update]
  before_action :set_multiple_open_block, only: %i[new create index]
  before_action :set_multiple_open_pieces, only: %i[new create index ]
   
  before_action only: %i[ show ] do
#   authenticate_owner(@user_text_answer)
  end
  
  def index
    @multiple_open_answers = @multiple_open_block.get_user_multiple_open_answers(current_user.id)
  end

  def show
  end

  def new
    @multiple_open_answers = [] 
    @multiple_open_pieces.each do |piece|
      @multiple_open_answers << piece.multiple_open_answers.build(user_id: current_user.id)
    end
  end

#  def edit
##    redirect_to root_path unless current_user&.id === @user_text_answer.user_id
#  end
#
  def create
    @multiple_open_answers = [] 
    @multiple_open_pieces.each do |piece|
      @multiple_open_answers << piece.multiple_open_answers.build(user_id: current_user.id)
    end

    user_answers = params[:answers].values
    @multiple_open_answers.each do |multiple_open_answer|
      user_answer = user_answers.find{|user_answer| (user_answer[:multiple_open_piece_id].to_i == multiple_open_answer.multiple_open_piece_id)}
      
      multiple_open_answer.answer = user_answer[:answer]
    end
     
begin
  ActiveRecord::Base.transaction do
    @multiple_open_answers.each{|hash| hash.save }
  end
  #handle success here
    respond_to do |format|
#        
#       format.html { redirect_to lesson_path(@user_text_block.lesson_group.lesson), notice: "Genial! Buen trabajo." }
        format.turbo_stream 
#      else
#        format.html { render :new, status: :unprocessable_entity }
#      end
    end
      
rescue ActiveRecord::RecordInvalid => exception
   #handle failure here
end
      # @multiple_open_answers
#    
#    respond_to do |format|
#      if @user_text_answer.save
#        
#        format.html { redirect_to lesson_path(@user_text_block.lesson_group.lesson), notice: "Genial! Buen trabajo." }
#        
#        format.turbo_stream { flash.now[:notice] = "Sweet! Good job!" }
#
#      else
#        format.html { render :new, status: :unprocessable_entity }
#      end
#    end
  end
#  
#  def update
#    respond_to do |format|
#      if @user_text_answer.update(user_text_answer_params)
#        format.html { redirect_to lesson_path(@user_text_block.lesson), notice: "User text answer was successfully updated." }
#
#      else
#        format.html { render :edit, status: :unprocessable_entity }
#      end
#    end
#  end
#

  # def destroy
  #   @user_text_answer.destroy

  #   respond_to do |format|
  #     format.html { redirect_to user_text_answers_url, notice: "User text answer was successfully destroyed." }
  #   end
  # end

  private
    def set_multiple_open_block
      @multiple_open_block = MultipleOpenBlock.find(params[:multiple_open_block_id])
    end

    def set_multiple_open_pieces
      @multiple_open_pieces = @multiple_open_block.multiple_open_pieces 
    end

#    def set_user_text_answer
#      @user_text_answer = UserTextAnswer.find(params[:id])
#    end
#
#    def create_user_text_answer
#      @user_text_answer = UserTextAnswer.new(user_text_answer_params)
#    end
#
   def multiple_open_answers_params 
 #    params.permit(:, :commit, :multiple_open_block_id, "answer": {})
   end
   
   def several_multiple_open_answers_params 
    # params.permit(:authenticity_token, :commit, :multiple_open_block_id, "answer": {})
    answers = params[:answers]
     answers.values

   # p multiple_open_answers_params
#     params.permit(:multiple_open_block_id, :authenticity_token, answers: [:answer, :multiple_open_piece]).require(:answers)

   end
end
