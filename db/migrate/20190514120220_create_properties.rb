class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.name :string
      t.belongs_to :category, index: true
      t.timestamps
    end
  end
end
