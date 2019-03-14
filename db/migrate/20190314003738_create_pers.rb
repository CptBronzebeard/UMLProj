class CreatePers < ActiveRecord::Migration[5.2]
  def change
    create_table :pers do |t|
      t.string :name
      t.timestamps
    end
  end
end
