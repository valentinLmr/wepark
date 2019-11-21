class Garage < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :rentals
  has_many :reviews
  validates :capacity, presence: true
  validates :price, presence: true
  validates :location, presence: true
  validates :description, presence: true
  geocoded_by :full_address
  after_validation :geocode, if: :will_save_change_to_full_address?
  monetize :price_cents

  def next_bookings
    Rental.where("garage_id = ? AND end_date > ?", self.id, Date.today)
  end
end
