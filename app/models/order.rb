class Order < ApplicationRecord
  belongs_to :user, optional: true
  has_many :entries, dependent: :destroy
end
