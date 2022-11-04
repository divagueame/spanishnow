class RichBlocksController < ApplicationController
  before_action :authenticate_admin, only: %i[index new create edit update]
#   before_action :authenticate_user!, only: %i[ index show]
  before_action :set_rich_block, only: %i[ show edit update
  ]
  ## edit update destroy 

  def index
    @rich_blocks = RichBlock.all
  end

  def show
  end

  def new
    @lesson_group_id = params[:lesson_group_id]
    @rich_block = RichBlock.new
    @rich_block.build_lesson_block
  end

  def edit
    @lesson_group_id = @rich_block.lesson_block.lesson_group_id
  end

  def create
    @rich_block = RichBlock.new(rich_block_params)
    @lesson_group = @rich_block.lesson_block.lesson_group
    respond_to do |format|
      if @rich_block.lesson_block.save
        format.html { redirect_to lesson_group_path(@lesson_group), notice: "Rich block was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    @lesson_group_id = @rich_block.lesson_block.lesson_group_id

    respond_to do |format|
      if @rich_block.update(rich_block_params)
        format.html {
          redirect_to lesson_group_path(@lesson_group_id), notice: "Rich block was successfully updated."
        }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
 
  end

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
      params.require(:rich_block)
            .permit(:content, :subheader,
              lesson_block_attributes: [:title, :id, :lesson_group_id])
    end
end
