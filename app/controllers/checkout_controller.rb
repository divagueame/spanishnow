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
                                                        name: 'name of the product'
                                                      }
                                                    },
                                                    quantity: 1
                                                  }],
                                                  mode: 'payment',
                                                  success_url: root_url,
                                                  cancel_url: root_url
                                                })
    redirect_to @session.url, status: 303, allow_other_host: true
  end
end
