class Product < ApplicationRecord
  belongs_to :category
  #has_many :properties, through: :category
  has_many :property_values
  has_many :entries
  accepts_nested_attributes_for :property_values
  def properties
    category.properties
  end
end
