class MultipleOpenPiecesController < ApplicationController
  # before_action :set_multiple_open_piece, only: %i[ show edit update destroy ]

  # def index
  #   @multiple_open_pieces = MultipleOpenPiece.all
  # end

  # def show
  # end

  # def new
  #   @multiple_open_piece = MultipleOpenPiece.new
  # end

  # def edit
  # end

  # def create
  #   @multiple_open_piece = MultipleOpenPiece.new(multiple_open_piece_params)

  #   respond_to do |format|
  #     if @multiple_open_piece.save
  #       format.html { redirect_to multiple_open_piece_url(@multiple_open_piece), notice: "Multiple open piece was successfully created." }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # def update
  #   respond_to do |format|
  #     if @multiple_open_piece.update(multiple_open_piece_params)
  #       format.html { redirect_to multiple_open_piece_url(@multiple_open_piece), notice: "Multiple open piece was successfully updated." }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # def destroy
  #   @multiple_open_piece.destroy

  #   respond_to do |format|
  #     format.html { redirect_to multiple_open_pieces_url, notice: "Multiple open piece was successfully destroyed." }
  #   end
  # end

  # private

  #   def set_multiple_open_piece
  #     @multiple_open_piece = MultipleOpenPiece.find(params[:id])
  #   end

  #   def multiple_open_piece_params
  #     params.require(:multiple_open_piece).permit(:full, :shown, :hint, :multiple_open_input_block_id)
  #   end
end
