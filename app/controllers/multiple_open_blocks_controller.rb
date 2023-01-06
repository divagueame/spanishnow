class MultipleOpenBlocksController < ApplicationController
  before_action :authenticate_admin, only: %i[index new create destroy edit update]
  before_action :set_multiple_open_block, only: %i[show edit update destroy]

  def index
    @multiple_open_blocks = MultipleOpenBlock.all
  end

  def show
  end

  def new
    @lesson_group_id = params[:lesson_group_id]
    @multiple_open_block = MultipleOpenBlock.new
    @multiple_open_block.build_lesson_block
    @multiple_open_block.multiple_open_pieces.build
  end

  def edit
    @lesson_group_id = @multiple_open_block.lesson_block.lesson_group_id
  end

  def create
    @multiple_open_block = MultipleOpenBlock.new(multiple_open_block_params)

    respond_to do |format|
      if @multiple_open_block.lesson_block.save
        format.html do
          lesson_group = multiple_open_block_params[:lesson_block_attributes][:lesson_group_id]
          redirect_to lesson_group_path(lesson_group), notice: 'Multiple open block was successfully created.'
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    @lesson_group_id = @multiple_open_block.lesson_block.lesson_group_id
    p @lesson_group_id

    respond_to do |format|
      if @multiple_open_block.update(multiple_open_block_params)
        format.html do
    #     redirect_to lesson_group_path(@lesson_group_id), notice: "Multilple  block was successfully updated."
          
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @multiple_open_block.destroy

    respond_to do |format|
      format.html { redirect_to multiple_open_blocks_url, notice: 'Multiple open block was successfully destroyed.' }
    end
  end

  private

  def set_multiple_open_block
    @multiple_open_block = MultipleOpenBlock.find(params[:id])
  end

  def multiple_open_block_params
    params.require(:multiple_open_block)
          .permit(:title, :body,
                  multiple_open_pieces_attributes: %i[id full shown hint],
                  lesson_block_attributes: %i[title id lesson_group_id])
  end
end
