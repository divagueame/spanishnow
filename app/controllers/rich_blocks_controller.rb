class RichBlocksController < ApplicationController
  before_action :authenticate_admin, only: %i[ new create ]
#   before_action :authenticate_user!, only: %i[ index show]
  before_action :set_rich_block, only: %i[ show
  ]
  ## edit update destroy 

#   def index
#     @lessons = Lesson.all
#   end

  def show
  end

  def new
    @rich_block = RichBlock.new
  end

#   def edit
#   end

  def create
    @rich_block = RichBlock.new(rich_block_params)

    respond_to do |format|
      if @rich_block.save
        format.html { redirect_to rich_block_path(@rich_block), notice: "Rich block was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
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
    def set_rich_block
      @rich_block = RichBlock.find(params[:id])
    end

    def rich_block_params
      params.require(:rich_block).permit(:content, :block_id)
    end
end
