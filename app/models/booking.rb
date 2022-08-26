require "date"

class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :cat

  validates :start_date, comparison: { greater_than_or_equal_to: Date.today, message: "invalid!"}
end
