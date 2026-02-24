class FlightsController  < ApplicationController
  def index
    @available_dates = Flight.available_dates
    @airports = Airport.all.map { |a| [ a.code, a.id ] }
  end
end
