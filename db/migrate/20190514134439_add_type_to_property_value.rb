class AddTypeToPropertyValue < ActiveRecord::Migration[5.2]
  def change
    add_column :property_values, :type, :string
    add_column :property_values, :value, :string
  end
end
