class CheckoutController < ApplicationController
  def create
    product = Product.find(params[:id])
    @session = Stripe::Checkout::Session.create({
                                                  payment_method_types: ['card'],
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
                                                  mode: 'payment',
                                                  success_url: root_url,
                                                  cancel_url: root_url
                                                })
    redirect_to @session.url, status: 303, allow_other_host: true, notice: 'Purchase Completed! Vamos!'
  end
end
