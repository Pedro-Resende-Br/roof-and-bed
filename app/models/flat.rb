class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo # change later to has_many_attached

  validates :title, :address, :city, :description, :price, presence: true
end
