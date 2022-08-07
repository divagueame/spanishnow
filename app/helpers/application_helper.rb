module ApplicationHelper
  def number_to_euro(amount)
    number_to_currency(amount, unit: '€').gsub(' ', '')
  end

  def get_course_btn(id,msg="Buy now")
    button_to msg, checkout_create_path, params: {id: id}, remote: true, data: {turbo: false}
  end
end
