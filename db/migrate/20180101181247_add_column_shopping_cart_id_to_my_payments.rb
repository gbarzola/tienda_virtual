class AddColumnShoppingCartIdToMyPayments < ActiveRecord::Migration
  def change
    add_reference :my_payments, :shopping_cart, index: true, foreign_key: true
  end
end
