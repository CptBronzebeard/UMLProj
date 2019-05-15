class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.belongs_to :user
      t.integer :state
      t.timestamps
    end
  end
end
