class Admin::OrderDetailsController < ApplicationController

  def update
  end

  def order_detail_params
    params.require(:order_detail).permit(:item_id, :order_id, :price, :amount, :making_status)
  end
end
