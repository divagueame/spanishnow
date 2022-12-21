module LessonGroupsHelper
  def get_next_path(lesson_group)
    return link_to 'Next', lesson_group_path(lesson_group.lower_item), class: "bg-purple-200 px-12 py-3 sbg-orange-100 hover:bg-orange-200 transition-all no-underline" if !lesson_group.last?
    return link_to 'End', lesson_path(lesson_group.lesson.lower_active_item), class: "px-12 py-3 bg-orange-100 hover:bg-orange-200 transition-all no-underline" if lesson_group.lesson.lower_active_item.present? 
    link_to 'Course', course_path(lesson_group.lesson.course), data: {turbo_frame: '_top' }, class: "px-12 py-3 bg-orange-100 hover:bg-orange-200 transition-all no-underline"
  end
end

