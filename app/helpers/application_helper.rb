module ApplicationHelper
  def number_to_euro(amount)
    number_to_currency(amount, unit: '€').gsub(' ', '')
  end

  def course_btn(id, msg="Get it!", classes="btn btn-1")
    button_to msg, checkout_create_path, params: {id: id}, remote: true, data: {turbo: false}, class: classes
  end
end
