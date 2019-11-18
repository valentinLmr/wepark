class Rental < ApplicationRecord
  belongs_to :garage
  belongs_to :user
  validates :start_date, presence: true
  validates :end_date, presence: true
end
