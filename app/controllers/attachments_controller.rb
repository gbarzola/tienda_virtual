class AttachmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_owner!
  
  def create
  
  end

  def destroy
  end

  def new
    @attachment = Attachment.new(attachment_params)
    if @attachment.save
      redirect_to @attachment.product , notice:"Se guardo"
    else
      redirect_to @product , notice:"No se guardo"
    end
  end
  
  private
    def authenticate_owner!
      @product = Product.find(params[:product_id])
      if @product.nil? || @product.user != current_user
        redirect_to root_path , notice: "No puedes editar ese producto"
        return
      end
    end
    
    def attachment_params
      params.require(:attachment).permit(:product_id,:archivo)
    end
end
