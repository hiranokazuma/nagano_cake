class Public::OrdersController < ApplicationController
  def new
  end

  def confirm
  end

  def complete
  end

  def create
  end

  def index
    @orders = Order.all
    @order = Order.new
  end

  def show
  end
end
