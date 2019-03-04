class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.integer :user_id
      t.integer :debt_id
      t.float :payment_amount
      t.text :comment

      t.timestamps
    end
  end
end
