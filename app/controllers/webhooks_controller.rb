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

    puts event.type
    case event.type
    when 'checkout.session.completed'
      puts "ppppppppppppppp1\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nppppppppppppPPPPPP"
      user_email = event.data.object.customer_details.email
      user_name = event.data.object.customer_details.name
      payment_status = event.data.object.payment_status

      generated_password = Devise.friendly_token.first(8)
      user = User.create!(:email => user_email, :password => generated_password)



      puts "ppppppppppppppp1\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nppppppppppppPPPPPP"
    when 'payment_intent.succeeded'
      
      Product.last.increment!(:sales_count) 
    end
    # status 200
    render json: { message: 'success' }
  end


  
 
end
