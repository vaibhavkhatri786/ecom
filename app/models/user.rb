class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
         
  has_one :cart, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :order_items, through: :orders
  has_many :addresses, dependent: :destroy
  
  validates :name, :phone, presence: true
end
