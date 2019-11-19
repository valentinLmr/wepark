puts "Je suis un Validator !!!!!!!!!!!!!!"
class AvailabilityGarageValidator < ActiveModel::Validator
  def validate_each(record, attribute, value)
    rental = Rental.where(["user_id =?", record.garage_id])
    date_ranges = rental.map { |r| r.start_date..r.end_date }

    date_ranges.each do |range|
      if range.include? value
        record.errors.add(attribute, "not available")
      end
    end
  end
end

