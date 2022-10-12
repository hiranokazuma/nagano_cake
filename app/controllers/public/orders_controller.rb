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

    if params[:order][:address_number] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + " " + current_customer.first_name

    elsif params[:order][:address_number] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.namespace

    end
  end

  def complete
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.item_id = cart_item.item_id
      @order_detail.order_id = @order.id
      @order_detail.price = cart_item.item.price
      @order_detail.amount = cart_item.amount
      @order_detail.save
    end
    redirect_to orders_complete_path
    @cart_items.destroy_all
  end

  def index #注文履歴一覧
    @orders = current_customer.orders
    @cart_items = current_customer.cart_items
  end

  def show #注文履歴詳細
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @order_submit = 0
    @order_details.each do |order_detail|
      @order_submit += order_detail.subtotal
    end
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end

end
