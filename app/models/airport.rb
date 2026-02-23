class Airport < ApplicationRecord
  has_many :arriving_flights, class_name: "Flight", foreign_key: :arriving_airport_id
  has_many :departing_flights, class_name: "Flight", foreign_key: :departing_airport_id

  scope :codes, -> { pluck(:code) }
end
