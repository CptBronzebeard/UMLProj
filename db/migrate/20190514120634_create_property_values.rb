class CreatePropertyValues < ActiveRecord::Migration[5.2]
  def change
    create_table :property_values do |t|
      t.belongs_to :property
      t.belongs_to :product
      t.timestamps
    end
    add_index :property_values, [:property, :product], unique: true
  end
end
