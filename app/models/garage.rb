class Garage < ApplicationRecord
  belongs_to :user
  validates :capacity, presence: true
  validates :price, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :photo, presence: true
  mount_uploader :photo, PhotoUploader
end
