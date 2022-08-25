class Cat < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :bookings, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :search_by_name_and_age,
    against: [ :name, :age ],
    using: {
    tsearch: { prefix: true }
  }
end
