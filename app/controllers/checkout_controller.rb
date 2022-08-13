class CheckoutController < ApplicationController
  def create
    product = Product.find(params[:id])
    @session = Stripe::Checkout::Session.create({
                                                  line_items: [{
                                                    price_data: {
                                                      currency: 'EUR',
                                                      unit_amount: product.price,
                                                      product_data: {
                                                        name: 'Mambo Spanish Course'
                                                      }
                                                    },
                                                    quantity: 1
                                                  }],
                                                  payment_method_types: ['card'],
                                                  mode: 'payment',
                                                  success_url: welcome_url,
                                                  cancel_url: root_url
                                                })
    redirect_to @session.url, status: 303, allow_other_host: true, notice: "Payment confirmend. Let's rock it! "
  end
end
