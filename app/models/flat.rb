class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :title, :address, :city, :description, :price, presence: true
end
