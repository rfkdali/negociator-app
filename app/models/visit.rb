class Visit < ApplicationRecord
  belongs_to :itinerary
  validates_presence_of :address, :duration

  geocoded_by :address       # can also be an IP address
  after_validation :geocode  # auto-fetch coordinates

  def get_coordinates
    get_coord(self.address)
  end

  private

  def get_coord address
    Geocoder.coordinates(address).join(", ")
  end
end
