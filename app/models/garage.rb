class Garage < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :rentals
  validates :capacity, presence: true
  validates :price, presence: true
  validates :location, presence: true
  validates :description, presence: true
  geocoded_by :location

  # 1: a decommenter pour les seeds
  # after_validation :geocode

  # 2: a  decommenter apres seed
  after_validation :geocode, if: :will_save_change_to_location?

  # def self.search(search)
  #   p search

  #   town = Garage.find(city: search)

  #   if town
  #     Garage.select(town)
  #   else
  #     Garage.all
  #   end
  # end

  def next_bookings
    Rental.where("garage_id = ? AND end_date > ?", self.id, Date.today)
  end
end
