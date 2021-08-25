class Robot < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  ROBOT_CATEGORIES = ['Gardening', 'Chef', 'Driver', 'Home', 'Nanny']
end
