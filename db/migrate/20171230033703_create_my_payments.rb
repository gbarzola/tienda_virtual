class CreateMyPayments < ActiveRecord::Migration
  def change
    create_table :my_payments do |t|
      t.string :email
      t.string :ip
      t.string :status
      t.decimal :fee
      t.string :paypal_id
      t.decimal :pago_total

      t.timestamps null: false
    end
  end
end
