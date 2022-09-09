class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all.page(params[:page])
    @customer = Customer.new
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :passwords, :postal_code, :address, :telephone_number, :is_active)
  end
end
