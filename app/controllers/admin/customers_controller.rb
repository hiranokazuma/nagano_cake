class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
    @customer = Customer.new
  end

  def show
  end

  def edit
  end

  def update
  end
end
