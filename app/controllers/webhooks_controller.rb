class WebhooksController < ApplicationController
  def create
    payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    event = nil
    p 'GOT'
    puts "\nTO SATRT"
    puts "\nTO SATRT"
    puts "\nTO SATRT"
    puts "\nTO SATRT"
    puts "\n "
    puts "\n "
    puts "\n "
    begin
      event = Stripe::Webhook.construct_event(
        payload, sig_header, Rails.application.credentials[:stripe][:webhook]
      )
    rescue JSON::ParserError => e
      # Invalid payload
      puts "\nJSON PARSER ERROR"
      puts "\nJSON PARSER ERROR"
      puts "\nJSON PARSER ERROR"
      status 400
      return
    end

    # Handle the event
    case event.type
    when 'checkout_session_completed'
      puts "\nJCHECKOUT"
      puts "\n    "
      puts "\n    "
      puts "\n    "
      puts "\n    "
      puts "\n"
      session = event.data.object
      @product = Product.find_by(price: session.amount_total)
      puts "\n PRODUCT"
      puts @product
      @product.increment(:sales_count)
    when 'payment_intent.succeeded'
      payment_intent = event.data.object # contains a Stripe::PaymentIntent
      puts 'PaymentIntent was successful!'
    when 'payment_method.attached'
      payment_method = event.data.object # contains a Stripe::PaymentMethod
      puts 'PaymentMethod was attached to a Customer!'
    # ... handle other event types
    else
      puts "Unhandled event type: #{event.type}"
    end

    status 200
    render json: { message: success }
  end
end
