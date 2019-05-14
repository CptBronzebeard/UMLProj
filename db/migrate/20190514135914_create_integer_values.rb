class CreateIntegerValues < ActiveRecord::Migration[5.2]
  def change
    create_table :integer_values do |t|

      t.timestamps
    end
  end
end
