class Public::CartItemsController < ApplicationController
  def index
    @cart_items = Cart_item.all
    @cart_item = Cart_item.new
  end

  def update
  end

  def create
    @cart_item = Cart_item.new(cart_item_params)
    if @cart_item.save
      flash[:notice] = "商品をカートに入れました。"
      redirect_to item_path(@item)
    else
      flash[:arlet] = "商品がカートに入っていません。"
      render item_path(@item)
    end
  end

  def destroy
  end

  def destroy_all
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end


end
