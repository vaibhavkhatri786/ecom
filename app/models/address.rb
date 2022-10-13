class Address < ApplicationRecord
  belongs_to :user, optional: true
  has_many :orders

  validates :city, :pincode, :state, :line2, :line1, presence: true
end
