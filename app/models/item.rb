class Item < ApplicationRecord
  has_one_attached :image

  validates :name, uniqueness: true
  validates :introduction, length: { maximum: 100 }
  validates :price, presence: true
  # validates :is_active, presence: true
  belongs_to :genre
  has_many :cart_items
  has_many :order_details
  
  def with_tax_price
    (price * 1.1).floor
  end
  
end
