class AttachmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_owner!
  
  def create
    raise params
  end

  def destroy
  end

  def new
  end
  
  private
    def authenticate_owner!
      @product = Product.find(params[:product_id])
      if @product.nil? || @product.user != current_user
        redirect_to root_path , notice: "No puedes editar ese producto"
        return
      end
    end
  
end
