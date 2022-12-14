class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true

  has_many :cart_items
  has_many :orders
  has_many :addresses

 # ログイン時に退会済みのユーザーが同じアカウントでログイン出来ないように
 # is_deletedがfalseならtrueを返す
  def active_for_authentication?
    super && (self.is_deleted == false)
  end

  def full_name
    self.last_name + " " + self.first_name
  end

  def full_name_kana
    self.last_name_kana + " " + self.first_name_kana
  end

  def customer_address
    '〒' + postal_code + ' ' + address + ' ' + full_name
  end

end
