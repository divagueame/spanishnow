class MultipleOpenBlocksController < ApplicationController
  before_action :authenticate_admin, only: %i[index new create destroy edit update]
  before_action :set_multiple_open_block, only: %i[ show edit update destroy ]

  def index
    @multiple_open_blocks = MultipleOpenBlock.all
  end

  def show
  end

  def new
    @multiple_open_block = MultipleOpenBlock.new
    @multiple_open_block.build_lesson_block(lesson_id: params[:lesson_id])

    15.times { @multiple_open_block.multiple_open_pieces.build }
  end

  def edit
  end

  def create
    @multiple_open_block = MultipleOpenBlock.new(multiple_open_block_params)
    respond_to do |format|
      if @multiple_open_block.save
        format.html {
          redirect_to lessons_path
          # redirect_to lesson_path(@multiple_open_block.lesson_group.lesson), notice: "Multiple open block was successfully created."
        }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @multiple_open_block.update(multiple_open_block_params)
        format.html { redirect_to multiple_open_block_url(@multiple_open_block), notice: "Multiple open block was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @multiple_open_block.destroy

    respond_to do |format|
      format.html { redirect_to multiple_open_blocks_url, notice: "Multiple open block was successfully destroyed." }
    end
  end

  private
    def set_multiple_open_block
      @multiple_open_block = MultipleOpenBlock.find(params[:id])
    end

    def multiple_open_block_params
      params.require(:multiple_open_block).permit(:title, :body, multiple_open_pieces_attributes: [:id, :full, :shown, :hint], lesson_block_attributes: [:title, :id, :lesson_id])
    end
end
