module ApplicationHelper

  def average(garage)
    all_rating = []
    garage.reviews.each do |review|
      all_rating << review.rating
    end
    sum = all_rating.sum
    all_rating.count == 0 ? 0 : (sum / all_rating.count).round
  end
end
