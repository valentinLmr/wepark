class Order < ApplicationRecord
  # belongs_to :garage
  belongs_to :user
  belongs_to :rental
  monetize :amount_cents

end
