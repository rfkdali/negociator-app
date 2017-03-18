class Itinerary < ApplicationRecord
  validates_presence_of :destination_latitude, :destination_longitude, :start_time

  def origin_latitude
    51.520042
  end

  def origin_longitude
    -0.098440
  end
end
