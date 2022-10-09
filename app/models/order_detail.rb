class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum making_status: { unable_to_make: 0, waiting_for_make: 1, now_making: 2, finished: 3 }

  def with_tax_price
    (price * 1.1).floor
  end

  def subtotal
      with_tax_price * amount
  end

  def full_name
    self.last_name + " " + self.first_name
  end

end
