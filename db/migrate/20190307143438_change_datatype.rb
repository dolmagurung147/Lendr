class ChangeDatatype < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :date_of_birth, :date
    change_column :debts, :due_date, :date
  end
end
