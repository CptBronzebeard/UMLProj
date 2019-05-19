class AddAmountToEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :entries, :amount, :integer
  end
end
