module UserTextBlocksHelper
    def answers_links(user_text_block)
        if !user_text_block.answered?(current_user)
            link_to 'Start', new_user_text_block_user_text_answer_path(user_text_block)
        end
    end
end


if false
 
 '<h3>Done</h3>'
    if block.block.user_text_answers.where(user_id: current_user.id).first.feedback.present?
      link_to 'Check it out', feedback_path(block.block.user_text_answers.where(user_id: current_user.id).first.feedback.id)
    end
end 