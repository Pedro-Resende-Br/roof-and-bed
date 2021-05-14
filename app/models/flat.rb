class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo # change later to has_many_attached
  geocoded_by :address

  include PgSearch::Model
  pg_search_scope :search_by_title_address_and_description,
    against: [ :title, :address, :description ],
    using: {
      tsearch: { prefix: true }
    }
    
  validates :title, :address, :description, :price, presence: true
  after_validation :geocode, if: :will_save_change_to_address?
end
