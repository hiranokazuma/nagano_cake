class Public::OrdersController < ApplicationController
  def new
  end

  def confirm
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
    @order = Order.find(params[:id])
  end
  
  private
  
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end
end
