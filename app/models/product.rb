class Product < ApplicationRecord
  has_many :carts, dependent: :destroy
  has_many :order_details, dependent: :destroy
  validates :name, presence: true
  validates :price, presence: true
  validates :tax_in_percentage, presence: true
end
