class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.belongs_to :product
      t.belongs_to :order
      t.timestamps
    end
  end
end
