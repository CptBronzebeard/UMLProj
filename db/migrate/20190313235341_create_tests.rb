class CreateTests < ActiveRecord::Migration[5.2]
  validates :name, presence: true
  def change
    create_table :tests do |t|
      t.string :name
      t.timestamps
    end
  end
end
