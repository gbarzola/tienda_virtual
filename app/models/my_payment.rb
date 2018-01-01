class MyPayment < ActiveRecord::Base
    include AASM
    
    aasm column: "status" do
        state :created, initial: true
		state :payed
		state :failed
    
        event :pay do
			after do
				# Marcar carrito como pagado shopping_cart.pay!
			end
			transitions from: :created, to: :payed
		end
    end
end
