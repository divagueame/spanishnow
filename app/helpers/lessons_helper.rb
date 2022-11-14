module LessonsHelper
  def controls_button(direction, lesson_group)
    disabled = false
    if
      direction == 'Previous' && lesson_group.first?
      disabled = true
    end
    
    if direction == 'Next' && lesson_group.last? then
      button_to 'Finish',
              { controller: 'study_session', action: 'update', direction: 'Finish'},
              method: :patch,
              form: { data:  { turbo_confirm: "This is the last block of this lesson. You won't be able to work on it anymore. Are you sure you are done?" }},
              class: "px-12 py-3 bg-amber-500 text-bold hover:bg-amber-300 transition-all"
    else

    button_to direction,
              { controller: 'study_session', action: 'update', direction: direction},
              method: :patch,
              disabled: disabled,
              class: "px-12 py-3 #{disabled ? 'bg-slate-100 text-slate-400 cursor-default opacity-80' : 'bg-orange-100 hover:bg-orange-200 transition-all'}"
      end
  end
end