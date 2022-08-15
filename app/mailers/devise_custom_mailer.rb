class DeviseCustomMailer < Devise::Mailer
  helper :application
  include Devise::Controllers::UrlHelpers
  default template_path: 'devise/mailer'
  layout 'mailer'

  def confirmation_instructions(record, token, opts={})
    super
  end
end