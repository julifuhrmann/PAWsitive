class Booking < ApplicationRecord
  belongs_to :cat_id
  belongs_to :user_id
end
