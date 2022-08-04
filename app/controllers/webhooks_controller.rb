class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    payload = request.body.read
    event = nil

    begin
      #   event = Stripe::Event.construct_from(
      #     JSON.parse(payload, symbolize_names: true)
      #   )
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
      puts "\n COMPLETED!"
      puts "\n    "
      puts "\n    "
      puts "\n    "

    else
      puts "Unhandled event type: #{event.type}"
    end

    status 200
  end
end
