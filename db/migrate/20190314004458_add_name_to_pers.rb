class AddNameToPers < ActiveRecord::Migration[5.2]
  def change
    add_column :pers, :name,:string
  end
end
