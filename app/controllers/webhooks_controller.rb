class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    endpoint_secret = Rails.application.credentials[:stripe][:webhook]
    # event = nil
    puts "\n COMPLETED!"
    puts endpoint_secret
    puts "\n    "
    head 200

    #       begin
    #     event = Stripe::Event.construct_from(
    #       JSON.parse(payload, symbolize_names: true)
    #     )
    #   rescue JSON::ParserError => e
    #     # Invalid payload
    #     puts "⚠️  Webhook error while parsing basic request. #{e.message})"
    #     status 400
    #     return
    #   end
  end

  # when 'checkout.session.completed'
  #   session = event.data.object
  #   puts "\n COMPLETED!"
  #   puts "\n    "
  #   p session
  #   puts "\n    "
  #   puts "\n    "
  #   puts "\n    "
  #   puts "\n    "
  #   puts "\n    "
  #   puts "\n    "
  #   puts "\n    "
  #   puts "\n    "
  #   puts "\n    "
  #   puts "\n    "
  #   puts "\n    "
  #   puts "\n    "
end
