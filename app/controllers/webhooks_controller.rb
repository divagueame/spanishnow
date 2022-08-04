class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    endpoint_secret = Rails.application.credentials[:stripe][:webhook]
    event = nil

    begin
      event = Stripe::Event.construct_from(
        JSON.parse(payload, symbolize_names: true)
      )
    rescue JSON::ParserError => e
      # Invalid payload
      puts "⚠️  Webhook error while parsing basic request. #{e.message})"
      status 400
      return
    end
    # Check if webhook signing is configured.
    if endpoint_secret
      # Retrieve the event by verifying the signature using the raw body and secret.
      signature = request.env['HTTP_STRIPE_SIGNATURE']
      begin
        event = Stripe::Webhook.construct_event(
          payload, signature, endpoint_secret
        )
      rescue Stripe::SignatureVerificationError
        puts "⚠️  Webhook signature verification failed. #{err.message})"
        status 400
      end
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
