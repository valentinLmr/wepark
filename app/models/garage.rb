class Garage < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :rentals
  validates :capacity, presence: true
  validates :price, presence: true
  validates :location, presence: true
  validates :description, presence: true
  def next_bookings
    Rental.where("garage_id = ? AND end_date > ?", self.id, Date.today)
  end
end
