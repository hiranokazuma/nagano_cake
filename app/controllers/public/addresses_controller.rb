class Public::AddressesController < ApplicationController
  def index
    @addresses = current_customer
    @address = current_customer
  end

  def edit
    @address = current_customer
  end

  def create
    @address = Address.new
  end

  def update
    @address = current_customer
    if @address.update(current_customer)
      flash[:notice] = "変更を保存しました。"
      redirect_to addresses_path
    else
      flash[:arlet] = "変更の保存に失敗しました。"
      render :edit
    end
  end
end
