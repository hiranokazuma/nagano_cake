class Public::OrdersController < ApplicationController
  def new
    @order = Order.new

  end

  def confirm
    @orders = Order.all
    @cart_items = CartItem.all
    @total_payment = 0
    @item = Item.new
    @order = Order.new(order_params)
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name
  end

  def complete
  end

  def create
    @order = Order.new
  end

  def index
    @orders = Order.all
    @order = Order.new
  end

  def show
    # @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end
end
