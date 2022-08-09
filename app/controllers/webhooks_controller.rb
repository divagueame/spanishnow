class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    endpoint_secret = Rails.application.credentials[:stripe][:webhook]
    event = nil

    begin
      event = Stripe::Webhook.construct_event(
        payload,
        sig_header,
        endpoint_secret
      )
    rescue JSON::ParserError => e
      # Invalid payload
      respond_to do |format|
        format.json { render json: { error: e }, status: :bad_request }
      end
    rescue Stripe::SignatureVerificationError => e
      # Invalid signature
      respond_to do |format|
        format.json { render json: { error: e }, status: :bad_request }
      end
    end

    case event.type
    when 'checkout.session.completed'
      session = event.data.object
      redirect_to welcome_path
    else
      puts "Unhandled event type: #{event.type}"
    end
    head 200
  end
end
