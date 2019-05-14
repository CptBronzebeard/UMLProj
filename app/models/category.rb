class Category < ApplicationRecord
  has_many :products
  has_many :properties
  has_many :subcategories, class_name "Category", foreign_key: "supcat_id"
  belongs_to :supercategory, class_name "Category", optional: true
end
