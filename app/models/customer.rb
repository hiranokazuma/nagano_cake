class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :email, presence: true, uniqueness: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :telepone_number, presence: true
  validates :password, presence: true, length: { minimum: 6 }

  has_many :cart_items
  has_many :orders
  has_many :addresses
end
