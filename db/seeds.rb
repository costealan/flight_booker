# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Airport.delete_all
Flight.delete_all

codes =[ "ATL", "DXB", "HND", "DFW", "PVG", "LHR", "IST", "CAN",  "DEN", "ORD", "DEL", "ICN", "LAX", "CDG", "PEK", "SIN", "AMS", "MAD", "SZX", "KUL" ]

codes.each do |airport|
  Airport.find_or_create_by!(code: airport)
end
puts "#{Airport.count} Airports have been created"

airports = Airport.all


start_time = Time.current

flights = []

30.times do |day |
  airports.each do |departure|
    airports.each do |arrival|
      next if departure.code == arrival.code
      flights << {
        departing_airport_id: departure.id,
        arriving_airport_id: arrival.id,
        date: Time.zone.now.beginning_of_day + day.days + rand(6..22).hours + [ 0, 15, 30, 45 ].sample.minutes
      }
    end
  end
end

Flight.insert_all(flights)
end_time = Time.current

puts "Flight seeds took #{end_time - start_time}"

puts "#{Flight.count} Flights have been created!"
