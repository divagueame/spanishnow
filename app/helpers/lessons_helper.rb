module LessonsHelper
  def controls_button(direction, lesson_group)
    disabled = false
    if  direction == 'Next' && lesson_group.last? ||
      direction == 'Previous' && lesson_group.first? ||
      direction == 'Finish' && !lesson_group.last?
      disabled = true
      return
    end
    
    button_to direction,
              { controller: 'study_session', action: 'update', direction: direction},
              method: :patch,
              disabled: disabled,
              class: "px-4 py-2 hover:bg-green-100 #{disabled ? 'bg-red-200' : 'bg-purple-100'}"
  end
end
