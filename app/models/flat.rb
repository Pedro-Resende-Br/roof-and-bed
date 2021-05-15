class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many_attached :photos
  geocoded_by :address

  include PgSearch::Model
  pg_search_scope :search_by_title_address_and_description,
    against: [ :title, :address, :description ],
    using: {
      tsearch: { prefix: true }
    }
    
  validates :title, :address, :description, :price, :photos, presence: true
  after_validation :geocode, if: :will_save_change_to_address?
end
