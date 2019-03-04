class CreateDebts < ActiveRecord::Migration[5.2]
  def change
    create_table :debts do |t|
      t.integer :user_id
      t.integer :category_id
      t.float :amount
      t.text :story
      t.datetime :due_date
      t.boolean :payback

      t.timestamps
    end
  end
end
