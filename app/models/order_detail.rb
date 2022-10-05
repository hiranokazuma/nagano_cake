class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum making_status: { unable_to_make: 0, waiting_for_make: 1, now_making: 2, finished: 3 }

end
