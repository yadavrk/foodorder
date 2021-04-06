class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product

  def self.add_order_detail(order)
    Cart.all.each do |cart|
      product = cart.product
      quantity = cart.quantity
      total_price = product.price * cart.quantity
      total_tax = (product.price * cart.quantity * product.tax_in_percentage)/100
      total_amount = total_price + total_tax
      OrderDetail.create(order_id: order.id, quantity: quantity, total_price: total_price, total_amount: total_amount, total_tax: total_tax, product_id: product.id)
    end
  end
end
