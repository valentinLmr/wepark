class Garage < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :user
  validates :capacity, presence: true
  validates :price, presence: true
  validates :location, presence: true
  validates :description, presence: true
end
