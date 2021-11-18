class Persona < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many_attached :photos

  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 500,
    too_long: "%{count} characters is the maximum allowed" }
  validates :location, presence: true
  validates :activity, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
