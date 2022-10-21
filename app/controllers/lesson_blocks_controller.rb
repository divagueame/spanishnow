class LessonBlocksController < ApplicationController
  before_action :authenticate_admin, only: %i[ new create destroy]
  before_action :set_lesson_block, only: %i[ edit destroy unlink ]

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

def edit
  block_target_url = edit_polymorphic_path(@lesson_block.block)
  redirect_to block_target_url
end

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

  def destroy
    @lesson_group = LessonGroup.find(@lesson_block.lesson_group.id)
    
    @lesson_block.destroy!

    respond_to do |format|
      format.html { redirect_to lesson_group_path(@lesson_group), notice: "Lesson block has been removed entirely.", status: 303  }
    end
  end

  def unlink

    @lesson_group = LessonGroup.find(@lesson_block.lesson_group.id)
    @lesson_block.lesson_group_id = nil
    @lesson_block.save!
    
    respond_to do |format|
      format.html { redirect_to lesson_group_path(@lesson_group), notice: "Lesson block has been unlinked from the lesson group.", status: 303  }
    end
  end


  private
    def set_lesson_block
      @lesson_block = LessonBlock.find(params[:id])
    end

    def lesson_block_params
      params.require(:lesson_block).permit(:id, :position, :lesson_group_id, :block_type, :block_id, :title)
    end

end