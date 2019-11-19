class Rental < ApplicationRecord
  belongs_to :garage
  belongs_to :user
  validates :start_date, :end_date, presence: true, availability: true
  validate :end_date_after_start_date, :date_unavailable


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


  def validate_each(record, attribute, value)
    rentals = Rental.where(["garage_id =?", record.garage_id])
    date_ranges = rentals.map { |r| r.start_date..r.end_date }

    date_ranges.each do |range|
      if range.include? value
        record.errors.add(attribute, "not available")
      end
    end
  end

