class MultipleOpenAnswerBlockController < ApplicationController
    def new
        p "CHIKIPUN ANSWER"
        
        @multiple_open_block = MultipleOpenBlock.find(multiple_open_answer_block_params[:multiple_open_block_id])
        p @multiple_open_block
        # @multiple_open_block
    end

    private

    def multiple_open_answer_block_params
      params.permit(:multiple_open_block_id)
    end
end
