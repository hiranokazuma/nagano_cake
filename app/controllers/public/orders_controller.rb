class Public::OrdersController < ApplicationController
  def new
      @order = Order.new
    # if @cart_items == nil
    #   render "public/cart_items/index"
    # else
    #   redirect_to new_order_path
    # end
  end

  def confirm
    @orders = Order.all
    @cart_items = CartItem.all
    @total_payment = 0
    @item = Item.new
    @order = Order.new(order_params)

    if params[:order][:address_id] == 0
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name

    elsif params[:order][:address_id] == 1
      Address.find(params[:order][:address_id])

    elsif params[:order][:address_id] == 2
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    end
  end

  def complete
  end

  def create
    @order = Order.new
  end

  def index #注文履歴一覧
    @orders = Order.all
    @order = Order.new
  end

  def show #注文履歴詳細
    # @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end

end
