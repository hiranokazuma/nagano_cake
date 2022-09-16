class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(current_customer)
      flash[:notice] = "変更を保存しました。"
      redirect_to customers_mypage_path(@customer)
    else
      flash[:arlet] = "変更の保存に失敗しました。"
      render :edit
    end
  end

  def unscribe
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
  end
end
