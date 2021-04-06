class OrdersController < ApplicationController
  protect_from_forgery :except => :create

  def index
    @orders = Order.includes(order_details: :product)
  end

  def create
    total_amount = Order.total_order_amount

    order = Order.new(total_amount: total_amount)
    if order.save
      OrderDetail.add_order_detail(order)
      Cart.destroy_all
      render json: order.to_json(include: :order_details), status: :ok
    else
      render json: order.errors
    end
  end
end
