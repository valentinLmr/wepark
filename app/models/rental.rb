class Rental < ApplicationRecord
  belongs_to :garage
  belongs_to :user
  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date

  # validates :check_date
  # validates :start_date, :end_date, presence: true

  # validates :end_date, presence: true
  # validates :start_date, presence: true

  def end_date_after_start_date
    # return "" if end_date.blank? || start_date.blank?

    if start_date > end_date
      errors.add(:end_date, "must be after the start date")
    end
 end
end
