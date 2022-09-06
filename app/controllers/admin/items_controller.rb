class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all
    @item = Item.new
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "新しい商品を登録しました。"
      redirect_to admin_item_path(@item)
    else
      flash[:arlet] = "新しい商品の登録に失敗しました。"
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "変更を保存しました。"
      redirect_to admin_items_path(@item)
    else
      flash[:arlet] = "変更の保存に失敗しました。"
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :is_active, :image)
  end

end
