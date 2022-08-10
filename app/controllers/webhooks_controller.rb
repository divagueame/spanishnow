class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

    # #  stripe listen --load-from-webhooks-api --forward-to localhost:3000
    # # 5555555555554444 > > 

  def create
    payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    event = nil

    begin
      event = Stripe::Webhook.construct_event(
        payload, sig_header, Rails.application.credentials[:stripe][:webhook]
      )
    rescue JSON::ParserError => e
      status 400
      return
    rescue Stripe::SignatureVerificationError => e
      # Invalid signature
      puts "Signature error"
      p e
      return
    end

    case event.type
    when 'payment_intent.succeeded'

      puts event.type
      # Handle the event
      puts "\n\n\n\n---"
      Product.last.increment!(:sales_count) 
 
    end

    render json: { message: 'success' }
  end


  
 
end
