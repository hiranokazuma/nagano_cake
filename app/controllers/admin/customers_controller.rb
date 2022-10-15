class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all.page(params[:page]).per(5)
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
    if @customer.update(customer_params)
      flash[:notice] = "変更を保存しました。"
      redirect_to admin_customers_path(@customer)
    else
      flash[:arlet] = "変更の保存に失敗しました。"
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :passwords, :postal_code, :address, :telephone_number, :is_deleted)
  end
end
