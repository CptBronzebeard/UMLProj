class Category < ApplicationRecord
  has_many :products
  has_many :properties
  has_many :subcategories, class_name: "Category", foreign_key: "supercategory_id"
  belongs_to :supercategory, class_name: "Category", optional: true
  def is_cat?
    subcategories.empty?
  end
  def is_root?
    supercategory.nil?
  end
end
