class PaymentsController < ApplicationController
  
  include PayPal::SDK::REST
  
  def create
    @payment = Payment.new({
			intent: "sale",
			payer:{
				payment_method: "paypal"
			},
			transactions: [
				{
					item_list: {
						items: [{name: "Demo", sku: :item, price: (@shopping_cart.total/100), currency: "USD" , quantity: 1}]
					},
					amount:{
						total: (@shopping_cart.total / 100),
						currency: "USD"
					},
					description: "Compra de tus productos en nuestra plataforma"
				}
			],
			redirect_urls: {
				return_url: "https://hackathon-minsa-gbarzola1.c9users.io",
				cancel_url: "https://hackathon-minsa-gbarzola1.c9users.io/carrito"
			}
    })
    
    if @payment.create
			redirect_to @payment.links.find{|v| v.method == "REDIRECT" }.href
		else
			raise @payment.error.to_yaml
		end
    
  end
end
