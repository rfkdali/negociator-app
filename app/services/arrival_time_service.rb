class ArrivalTimeService
  def initialize visit
    @visit = visit
    @itinerary = @visit.itinerary
    @travel_time = 0.0
  end

  def call
    @itinerary.has_no_visits? ? update_itinerary_first_visit : update_itinerary

    @visit.update(
      travel_time: @travel_time / 60,
      arrival_time: @itinerary.arrival_time
    )
  end

  def update_itinerary_first_visit
    @itinerary.update(
      arrival_time: @itinerary.start_time + get_travel_time,
      last_visit_address: @visit.address
    )
  end

  def update_itinerary
    @itinerary.update(
      arrival_time: @itinerary.arrival_time + get_travel_time + @itinerary.last_visit_duration,
      last_visit_address: @visit.address
    )
  end

  def get_travel_time
    @travel_time = TravelTimeService.new(
      start_coord,
      end_coord
    ).call.minutes
  end

  def start_coord
    @itinerary.has_no_visits? ? @itinerary.office_coordinates : @itinerary.last_visit_coordinates
  end

  def end_coord
    @visit.get_coordinates
  end
end