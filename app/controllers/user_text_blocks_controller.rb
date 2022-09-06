class UserTextBlocksController < ApplicationController
  before_action :authenticate_admin, only: %i[index edit update destroy]
  before_action :set_user_text_block, only: %i[ show edit update destroy ]

  # GET /user_text_blocks or /user_text_blocks.json
  def index
    @user_text_blocks = UserTextBlock.all
  end

  # GET /user_text_blocks/1 or /user_text_blocks/1.json
  def show
  end

  # GET /user_text_blocks/new
  def new
    @user_text_block = UserTextBlock.new
  end

  # GET /user_text_blocks/1/edit
  def edit
  end

  # POST /user_text_blocks or /user_text_blocks.json
  def create
    @user_text_block = UserTextBlock.new(user_text_block_params)

    respond_to do |format|
      if @user_text_block.save
        format.html { redirect_to user_text_block_url(@user_text_block), notice: "User text block was successfully created." }
        format.json { render :show, status: :created, location: @user_text_block }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_text_block.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_text_blocks/1 or /user_text_blocks/1.json
  def update
    respond_to do |format|
      if @user_text_block.update(user_text_block_params)
        format.html { redirect_to user_text_block_url(@user_text_block), notice: "User text block was successfully updated." }
        format.json { render :show, status: :ok, location: @user_text_block }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_text_block.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_text_blocks/1 or /user_text_blocks/1.json
  def destroy
    @user_text_block.destroy

    respond_to do |format|
      format.html { redirect_to user_text_blocks_url, notice: "User text block was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_text_block
      @user_text_block = UserTextBlock.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_text_block_params
      params.require(:user_text_block).permit(:promptTitle, :promptBody, :promptLength, :title, :body, :user_id)
    end
end
