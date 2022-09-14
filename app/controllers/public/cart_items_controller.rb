class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @cart_item = CartItem.new
  end

  def update
  end

  def create
    # @item = Item.find(cart_item_params[:item_id])
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if @cart_item.save
      flash[:notice] = "商品をカートに入れました。"
      redirect_to cart_items_path
    else
      flash[:arlet] = "商品がカートに入っていません。"
      @item = Item.find(params[:cart_item][:item_id])
      @cart_item = CartItem.new
      render "public/items/show"
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
