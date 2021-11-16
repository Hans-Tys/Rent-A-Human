class Persona < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many_attached :photo

  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :activity, presence: true


end
