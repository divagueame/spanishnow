class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    endpoint_secret = Rails.application.credentials[:stripe][:webhook]
    event = nil
    puts "\n COMPLETED!"
    puts endpoint_secret
    puts "\n    "

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
    head 200
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
