class Itinerary < ApplicationRecord
  has_many :visits, dependent: :destroy
    
  validates_presence_of :start_time


  def travel_time
    TravelTime.new(destination_coord).duration
  end

  def arrival_time
    self.start_time + get_travel_time.minutes
  end

  private

  def destination_coord
    "#{self.destination_latitude}, #{self.destination_longitude}"
  end
end
