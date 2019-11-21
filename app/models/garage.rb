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

  def display_add_review_form(user)
    user.rentals.select { |rental| rental.start_date <= Date.today }.map(&:garage).include?(self)
  end
end
