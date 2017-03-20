class Visit < ApplicationRecord
  belongs_to :itinerary
  validates_presence_of :address, :duration
end
