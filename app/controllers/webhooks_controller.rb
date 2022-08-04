class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    payload = request.body.read
    event = nil
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']

    begin
      event = Stripe::Webhook.construct_event(
        payload, sig_header, Rails.application.credentials[:stripe][:webhook]
      )
    rescue JSON::ParserError => e
      # Invalid payload
      puts "⚠️  Webhook error while parsing basic request. #{e.message})"
      status 400
      return
    end

    # Handle the event
    case event.type
    when 'checkout.session.completed'
      session = event.data.object
      puts "\n COMPLETED!"
      puts "\n    "
      p session
      puts "\n    "
      puts "\n    "
      puts "\n    "
      puts "\n    "
      puts "\n    "
      puts "\n    "
      puts "\n    "
      puts "\n    "
      puts "\n    "
      puts "\n    "
      puts "\n    "
      puts "\n    "

    else
      puts "Unhandled event type: #{event.type}"
    end

    status 200
  end
end
