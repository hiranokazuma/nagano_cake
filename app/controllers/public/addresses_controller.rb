class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.all
    @address = Address.new
    @customer = current_customer.id
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      flash[:notice] = "新しい配送先を登録しました。"
      redirect_to addresses_path
    else
      flash[:arlet] = "新しい配送先の登録に失敗しました。"
      @addresses = Address.all
      render :index
    end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:notice] = "変更を保存しました。"
      redirect_to addresses_path
    else
      flash[:arlet] = "変更の保存に失敗しました。"
      render :edit
    end
  end

  def destroy
    @address = Address.find(params[:id])
    if @address.destroy
      flash[:notice] = "配送先を削除しました。"
      redirect_to addresses_path
    else
      flash[:arlet] = "配送先の削除に失敗しました。"
      render :index
    end
  end

  private

  def address_params
   params.require(:address).permit(:customer_id, :address, :postal_code, :namespace)
  end

end
