class TravelTimeService
  include HTTParty

  base_uri 'https://developer.citymapper.com'

  def initialize startcoord, endcoord
    @options = {
      query: {
        startcoord: startcoord,
        endcoord: endcoord,
        time_type: 'arrival',
        key: ENV['citymapper_key']
      }
    }
  end

  def call
    self.class.get('/api/1/traveltime/', @options)["travel_time_minutes"]
  end
end