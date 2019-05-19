class AddTotalToEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :entries, :total, :integer
  end
end
