class LessonsBlocksController < ApplicationController
  before_action :authenticate_admin, only: %i[ new create ]
#   before_action :authenticate_user!, only: %i[ index show]
#   before_action :set_block, only: %i[ show edit update destroy ]

#   def index
#     @lessons = Lesson.all
#   end

#   def show
#   end

def new
  
  # @block_type = Block.block_types[params[:block_type]]
  # @new_block_type = params[:block_type].singularize.classify.constantize
  
  # p "LAST"
  # p RichBlock.last
  # p "BLOCKTYPE"
  # p @new_block_type
  # @block = Block.new(lesson_id: params[:lesson_id], block_type: @block_type)
  # p @block
  # p @block.valid?
  # @block_type = params[:block_type].singularize.classify.constantize
  # @block.block_type = @block_type
  # p @block_type
  # debugger
    # if block_type(params[:type]) then 
  # binding.break
  # p params[:block_type]
  # @block_type = params[:block_type].on
  # @block_type = params[:block_type].constantize.new
  # p " p  "
      # p @block_type.new(block_id: 
    # end
    # binding.break
end

#   def edit
#   end

def create
  # @block = Block.new(block_params)
  
  # respond_to do |format|
  #   if @block.save
  #     format.html { redirect_to lesson_url(@block.lesson_id), notice: "Block was successfully created." }
  #   else
  #     format.html { render :new, status: :unprocessable_entity }
  #   end
  # end
end

#   def update
#     respond_to do |format|
#       if @lesson.update(lesson_params)
#         format.html { redirect_to lesson_url(@lesson), notice: "Lesson was successfully updated." }
#       else
#         format.html { render :edit, status: :unprocessable_entity }
#       end
#     end
#   end

#   def destroy
#     @lesson.destroy

#     respond_to do |format|
#       format.html { redirect_to lessons_url, notice: "Lesson was successfully destroyed." }
#     end
#   end

  private
    def set_lesson_block
      @lesson_block = LessonBlock.find(params[:id])
    end

    def lesson_block_params
      params.require(:lesson_block).permit(:position, :lesson_id, :block_type, :block_id, :title)
    end
    
end