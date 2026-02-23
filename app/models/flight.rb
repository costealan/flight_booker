class Flight < ApplicationRecord
  belongs_to :departing_airport, class_name: "Airport"
  belongs_to :arriving_airport, class_name: "Airport"

  scope :available_dates, -> {
    distinct.order(:date).pluck("DATE(date)")
  }
end
