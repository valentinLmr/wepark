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


  def price_per_day
    (self.price_cents.fdiv(100) / 30).round(2)
  end

  def payement
    self.price_cents.fdiv(30).round

  def display_add_review_form(user)
    user.rentals.select { |rental| rental.start_date <= Date.today }.map(&:garage).include?(self)

  end
end
