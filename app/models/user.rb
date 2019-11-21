class User < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :garages, dependent: :destroy
  has_many :rentals, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
