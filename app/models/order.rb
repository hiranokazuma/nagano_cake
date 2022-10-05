class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting_charge: 0, confirm_charge: 1, now_making: 2, preparing_sending: 3, sent: 4 }

  def shipping_cost
    800
  end

  def with_tax_price
    (price * 1.1).floor
  end

  def subtotal
      item.with_tax_price * amount
  end

end
