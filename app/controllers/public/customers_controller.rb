class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice] = "変更を保存しました。"
      redirect_to customers_mypage_path(@customer)
    else
      flash[:arlet] = "変更の保存に失敗しました。"
      render :edit
    end
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :passwords, :postal_code, :address, :telephone_number, :is_deleted)
  end

end
