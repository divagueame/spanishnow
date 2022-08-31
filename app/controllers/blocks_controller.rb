class BlocksController < ApplicationController
  before_action :authenticate_admin, only: %i[ new create ]
#   before_action :authenticate_user!, only: %i[ index show]
#   before_action :set_block, only: %i[ show edit update destroy ]

#   def index
#     @lessons = Lesson.all
#   end

#   def show
#   end

  def new
    @block = Block.new
  end

#   def edit
#   end

#   def create
#     @lesson = Lesson.new(lesson_params)

#     respond_to do |format|
#       if @lesson.save
#         format.html { redirect_to lesson_url(@lesson), notice: "Lesson was successfully created." }
#       else
#         format.html { render :new, status: :unprocessable_entity }
#       end
#     end
#   end

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
    def set_block
      @block = Block.find(params[:id])
    end

    def block_params
      params.require(:block).permit(:title, :position, :lesson_id)
    end
end
