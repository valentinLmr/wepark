class Garage < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :rentals
  validates :capacity, presence: true
  validates :price, presence: true
  validates :location, presence: true
  validates :description, presence: true
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  
  def next_bookings
    Rental.where("garage_id = ? AND end_date > ?", self.id, Date.today)
  end
end
