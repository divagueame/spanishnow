class YoutubeBlocksController < ApplicationController
  before_action :authenticate_admin, only: %i[index new create edit update]
  before_action :set_youtube_block, only: %i[ show edit update destroy ]

  def show
  end


  def new
    @lesson_group_id = params[:lesson_group_id]
    @youtube_block = YoutubeBlock.new
    @youtube_block.build_lesson_block
  end


  def edit
    @lesson_group_id = @youtube_block.lesson_block.lesson_group_id
  end


  def create
    @youtube_block = YoutubeBlock.new(youtube_block_params)
    @lesson_group = @youtube_block.lesson_block.lesson_group

    respond_to do |format|
      if @youtube_block.lesson_block.save
        format.html { redirect_to lesson_group_path(@lesson_group), notice: "Youtube block was successfully created." }

      else
        format.html { render :new, status: :unprocessable_entity }

      end
    end
  end

  
  def update
    @lesson_group_id = @youtube_block.lesson_block.lesson_group_id

    respond_to do |format|
      if @youtube_block.update(youtube_block_params)
        format.html { 
          redirect_to lesson_group_path(@lesson_group_id), notice: "Youtube block was successfully updated." 
        }
      else
        format.html { render :edit, status: :unprocessable_entity }

      end
    end
  end


  def destroy
    @youtube_block.destroy

    respond_to do |format|
      format.html { redirect_to youtube_blocks_url, notice: "Youtube block was successfully destroyed." }

    end
  end

  private

    def set_youtube_block
      @youtube_block = YoutubeBlock.find(params[:id])
    end


    def youtube_block_params
      params.require(:youtube_block)
            .permit(:url, :code,
                   lesson_block_attributes: [:title, :id, :lesson_group_id])
    end
end
