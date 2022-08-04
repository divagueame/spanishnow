class WebhooksController < ApplicationController
  def create
    puts "\nCHECKOUT"
    puts "\n    "
    puts "\n    "
    puts "\n    " 
    
    payload = request.body.read
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

# Handle the event
case event.type
    
when 'checkout_session_completed'
    puts "\n COMPLETED!"
    puts "\n    "
    puts "\n    "
    puts "\n    " 

  else
    puts "Unhandled event type: #{event.type}"
  end

  status 200
  
 

end
