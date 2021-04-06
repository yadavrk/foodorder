class Order < ApplicationRecord
  has_many :order_details

  def self.total_order_amount
    total_amount = 0
    Cart.all.each do |cart|
      product = cart.product
      total_amount = total_amount + product.price * cart.quantity + (product.price * cart.quantity * product.tax_in_percentage)/100
    end
    total_amount
  end
end
