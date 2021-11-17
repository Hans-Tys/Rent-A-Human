class Review < ApplicationRecord
  belongs_to :booking

  validates :rating, inclusion: { in: 0..5 }, presence: true
  validates :comment, length: { minimum: 6 }, presence: true
end
