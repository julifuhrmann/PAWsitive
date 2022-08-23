class Cat < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :bookings
end
