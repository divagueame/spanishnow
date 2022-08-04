class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    endpoint_secret = Rails.application.credentials[:stripe][:webhook]
    event = nil

    begin
      event = Stripe::Webhook.construct_event(
        payload, sig_header, endpoint_secret
      )
    rescue JSON::ParserError => e
      # Invalid payload
      status 400
      return
    rescue Stripe::SignatureVerificationError => e
      # Invalid signature
      status 400
      return
    end

    # Handle the event
    case event.type
    when 'payment_intent.succeeded'
      payment_intent = event.data.object # contains a Stripe::PaymentIntent
      puts 'PaymentIntent was successful!'
    when 'payment_method.attached'
      payment_method = event.data.object # contains a Stripe::PaymentMethod
      puts 'PaymentMethod was attached to a Customer!'
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
