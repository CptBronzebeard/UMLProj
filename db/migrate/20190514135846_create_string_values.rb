class CreateStringValues < ActiveRecord::Migration[5.2]
  def change
    create_table :string_values do |t|

      t.timestamps
    end
  end
end
