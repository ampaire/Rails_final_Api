class CartsController < ApplicationController
  def index
    @carts = Cart.all
    json_response(@carts)
  end

  def create
    @cart = current_user.carts.create!(cart_params)
    json_response(@cart, :created)
  end

  def destroy
    @cart = Cart.where(item_id: params[:item_id])[0]
    @cart.destroy
    head :no_content
  end

  private

  def cart_params
    params.permit(:item_id)
  end
end
