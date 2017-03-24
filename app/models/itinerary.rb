class Itinerary < ApplicationRecord
  has_many :visits, dependent: :destroy
    
  validates_presence_of :start_time

  def has_no_visits?
    self.last_visit_address.nil?
  end

  def last_visit_coordinates
    get_coord(self.last_visit_address)
  end

  def last_visit_duration
    Visit.find_by(address: self.last_visit_address).duration.minutes
  end

  def office_coordinates
    get_coord("6-8 Long Ln, London EC1A 9HF, UK")
  end

  private

  def get_coord address
    Geocoder.coordinates(address).join(", ")
  end
end
