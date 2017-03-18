require 'rails_helper'

RSpec.describe Itinerary, type: :model do
  describe 'Origin address'
    subject(:itinerary) { Itinerary.new }

    office_address = {
      origin_latitude: 51.520042,
      origin_longitude: -0.098440
    }

    it 'is always Barbican office' do
      expect(subject.origin_latitude).to eq(office_address[:origin_latitude])    
      expect(subject.origin_longitude).to eq(office_address[:origin_longitude])    
    end
end
