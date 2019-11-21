class Order < ApplicationRecord
  belongs_to :user
  belongs_to :garage
  monetize :amount_cents
end
