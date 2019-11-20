class Review < ApplicationRecord
  belongs_to :garage
  belongs_to :user
end
