class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = cuurent_customer
  end

  def update
    @customer = current_customer
  end

  def unscribe
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
  end
end
