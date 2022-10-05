class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @cart_item = CartItem.new
    @total_payment = 0
    @item = Item.new

  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      flash[:notice] = "変更を保存しました。"
      redirect_to cart_items_path
    else
      flash[:arlet] = "変更の保存に失敗しました。"
      render :index
    end
  end

  def create
    @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    if @cart_item
      @cart_item.update(amount: @cart_item.amount + params[:cart_item][:amount].to_i)
      flash[:notice] = "商品をカートに入れました。"
      redirect_to cart_items_path
    else
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
      @cart_item.save
      flash[:notice] = "商品をカートに入れました。"
      redirect_to cart_items_path
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    if @cart_item.destroy
      flash[:notice] = "カートに入れた商品を削除しました。"
      redirect_to cart_items_path
    else
      flash[:arlet] = "削除に失敗しました。"
      render :index
    end
  end

  def destroy_all
    if current_customer.cart_items.destroy_all
      flash[:notice] = "カートに入れた商品を削除しました。"
      redirect_to cart_items_path
    else
      flash[:arlet] = "削除に失敗しました。"
      render :index
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end

end
