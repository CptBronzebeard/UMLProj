class PropertyValue < ApplicationRecord
  belongs_to :property
  belongs_to :product
  validates :property, uniqueness: {scope: :product}
end
