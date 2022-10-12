class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @orders = Order.all
    @order_detail = Order.find(params[:id])
    @order_details = @order.order_details
    @order_submit = 0
    @order_details.each do |order_detail|
      @order_submit += order_detail.subtotal
    end
  end

  def update
    @order = Order.find(params[:id])
    @order.update(status: params[:order][:status])
    @order_details = @order.order_details
    if @order.status == "confirm_charge"
      @order_details.update_all(making_status: :waiting_for_make)
    elsif @order.status == "waiting_charge"
      @order_details.update_all(making_status: :unable_to_make)
    end
    redirect_to admin_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end
end
