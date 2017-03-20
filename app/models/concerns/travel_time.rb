class TravelTime
  include HTTParty

  base_uri 'https://developer.citymapper.com'

  def initialize endcoord
    @options = {
      query: {
        startcoord: '51.520042, -0.098440', # Rentify office
        endcoord: endcoord,
        time_type: 'arrival',
        key: ENV['citymapper_key']
      }
    }
  end

  def duration
    self.class.get('/api/1/traveltime/', @options)["travel_time_minutes"]
  end
end
