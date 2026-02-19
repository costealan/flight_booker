class Flight < ApplicationRecord
  belongs_to :departing_airport
  belongs_to :arriving_airport
end
