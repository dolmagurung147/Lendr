class AddColumnToDebtsTable < ActiveRecord::Migration[5.2]
  def change
    add_column :debts, :title, :string
  end
end
