class Robot < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  include PgSearch::Model
  pg_search_scope :search_by_name_and_category,
  against: [ :name, :category ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }

  ROBOT_CATEGORIES = ['All', 'Gardening', 'Chef', 'Driver', 'Home', 'Nanny']
end
