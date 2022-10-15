class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details
    @order_detail.update(making_status: params[:order_detail][:making_status])
    if @order_details.where(making_status: "now_making").count >= 1
      @order.status = "now_making"
      @order.save
    elsif @order.order_details.count == @order_details.where(making_status: "finished").count
      @order.status = "preparing_sending"
      @order.save
    end
    redirect_to admin_path(@order)
  end

  def order_detail_params
    params.require(:order_detail).permit(:item_id, :order_id, :price, :amount, :making_status)
  end
end
