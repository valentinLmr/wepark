class Rental < ApplicationRecord
  belongs_to :garage
  belongs_to :user

  validates :start_date, :end_date, presence: true

  # end_date_after_start_date, :validate_each

  # validates :check_date

  # def end_date_after_start_date
  #   # return "" if end_date.blank? || start_date.blank?
  #   if start_date > end_date
  #     errors.add(:end_date, "must be after the start date")
  #   end
  # end

  # def parse_date(year, month, day)
  #   Date.parse("#{year}-#{month}-#{day}")
  # end

  # def validate_each
  #   rentals = self.garage.rentals
  #   rentals = rentals.map do |rental|
  #     (rental.start_date..rental.end_date).to_a
  #   end

  #   rentals.flatten
  #   rental_array_date = (self.start_date..self.end_date).to_a

  #   # Rental.where("start_date >= ? AND end_date <= ?", record.start_date, record.end_date)
  #   # rentals = Rental.where(["garage_id =?", record.garage_id])
  #   # date_ranges = rentals.map { |r| r.start_date..r.end_date }
  #   if rentals.flatten - rental_array_date != rentals.flatten
  #     errors.add(:start_date, "not available")
  #   end
  # end
end
