class Airport < ApplicationRecord
  has_many :arriving_flights, foreign_key: :arriving_airport_id
  has_many :departing_flights, foreign_key: :departing_airport_id
end
