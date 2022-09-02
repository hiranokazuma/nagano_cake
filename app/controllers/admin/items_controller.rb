class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all
    @item = Item.new
    @genre = Genre.find_by(@item.genre_id)
    @item = Item.find_by(params[:id])

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "新しい商品を登録しました。"
      redirect_to admin_item_path
    else
      flash[:arlet] = "新しい商品の登録に失敗しました。"
      render :new
    end
  end

  def show
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :is_active)
  end

end
