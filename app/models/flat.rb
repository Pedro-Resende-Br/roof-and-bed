class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo # change later to has_many_attached
  geocoded_by :address
  
  validates :title, :address, :description, :price, presence: true
  after_validation :geocode, if: :will_save_change_to_address?
end
