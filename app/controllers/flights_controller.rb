class FlightsController  < ApplicationController
  def index
    @available_dates = Flight.available_dates

    @airports = Airport.all.map { |a| [ a.code, a.id ] }

    if params[:arriving_airport_id] && params[:departing_airport_id] && params[:date] && params[:num_passengers]
      selected_date = Date.parse(params[:date])

      @flights = Flight.where(
                departing_airport_id: params[:departing_airport_id],
                arriving_airport_id: params[:arriving_airport_id],
                date: selected_date.beginning_of_day..selected_date.end_of_day,
      )
      @num_passengers = params[:num_passengers]
    end
  end
end
