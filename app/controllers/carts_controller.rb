class CartsController < ApplicationController
  protect_from_forgery :except => :create

  def create
    cart = Cart.new(cart_params)
    if cart.save
      render json: cart
    else
      render json: cart.errors
    end
  end

  private
  def cart_params
    params.require(:cart).permit(:product_id, :quantity)
  end
end
