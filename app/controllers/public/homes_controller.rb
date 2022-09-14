class Public::HomesController < ApplicationController
  def top
    @items = Item.all
    @item = Item.new
    # @customer = Customer.find(params[:id])
  end

  def about
  end

  # private
  # def customer_params
  #   params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)
  # end
end
