require "date"

class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :cat

  validates :start_date, comparison: { greater_than: Date.today, message: "invalid!"}
end
