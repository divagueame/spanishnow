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
  end

  def create
    # @rich_block = RichBlock.new(subheader:  rich_block_params[:subheader], content: rich_block_params[:content])
    @rich_block = RichBlock.new(rich_block_params)
    @lesson_group = LessonGroup.find(rich_block_params[:lesson_block_attributes][:lesson_group_id])
    
    # @lesson_block_title = rich_block_params[:lesson_block_attributes][:title]
    
    respond_to do |format|
      # if @lesson_group.lesson_blocks.create(block: @rich_block, title:  @lesson_block_title)
      if @rich_block.lesson_block.save
        format.html { redirect_to lesson_group_path(@lesson_group), notice: "Rich block was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update


    # p params
    # p "PARAMS:"
    # p @rich_block
    # p "RICH BLOCk:"
    # @lesson = @rich_block.lesson
    # p @lesson
    # @lesson_block_title = rich_block_params[:lesson_block_attributes][:title]
    # @lesson_block_title
    # @rich_block.update(content: rich_block_params[:content])
    # @lesson.lesson_blocks.update(block: @rich_block, title: @lesson_block_title)
  #  redirect_to lesson_path(@lesson), notice: "Rich block was successfully created." 
    # p @lesson
    # @lesson.update(comments_attributes: [{id: 4, content: 'bob'}]
    # p rich_block_params
    # p '@rich_block !!!!!!!'
    # p rich_block_params
    # @lesson = Lesson.find(@rich_block.lesson.id)
    # p @lesson
    # @lesson.lesson_blocks.update(block: @rich_block, title: )
    # respond_to do |format|
    #   if @lesson.update(lesson_params)
    #     format.html { redirect_to lesson_url(@lesson), notice: "Lesson was successfully updated." }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #   end
    # end
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
