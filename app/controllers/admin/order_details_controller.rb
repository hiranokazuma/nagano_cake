class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_details = @order.order_details
    @order_detail.update(making_status: params[:order_detail][:making_status])
    if @order_detail.making_status == "now_making"
      @order.update_all(status: :now_making)
    elsif @order_detail.making_status == "finished"
      @order.update_all(status: :preparing_sending)
    end
    redirect_to admin_path(@order)
  end

  def order_detail_params
    params.require(:order_detail).permit(:item_id, :order_id, :price, :amount, :making_status)
  end
end
