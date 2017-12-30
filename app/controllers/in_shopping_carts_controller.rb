class InShoppingCartsController < ApplicationController

    def create
        #agregar carrito de compra
        in_shopping_cart = InShoppingCart.new(product_id: params[:product_id], shopping_cart: @shopping_cart)
        
        if in_shopping_cart.save
            redirect_to "/carrito", notice: "Guardamos producto en carrito"
        else
            redirect_to products_path(id: params[:product_id]), notice: "No pudimos agregar al carrito"
        end
        
    end
    
    def destroy
        #eliminar carrito de compra
        @in_shopping_cart = InShoppingCart.find(params[:id])

		@in_shopping_cart.destroy

		redirect_to carrito_path
    end

end
