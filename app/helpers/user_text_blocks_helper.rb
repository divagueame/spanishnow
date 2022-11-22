module UserTextBlocksHelper
    def answers_links(user_text_block)
        if !user_text_block.answered?(current_user)
            link_to 'Start', new_user_text_block_user_text_answer_path(user_text_block)
        else
            link_to 'Review your submission', user_text_block_user_text_answer_path(user_text_block, user_text_block.user_text_answers.where(user_id: current_user.id).first)
        end
    end
end

#     if block.block.user_text_answers.where(user_id: current_user.id).first.feedback.present?
#       link_to 'Check it out', feedback_path(block.block.user_text_answers.where(user_id: current_user.id).first.feedback.id)
#     end 