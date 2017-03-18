require 'rails_helper'

RSpec.describe Itinerary, type: :model do
  subject(:itinerary) { Itinerary.new }

  describe 'Validations' do
    it { should validate_presence_of(:destination_latitude) }
    it { should validate_presence_of(:destination_longitude) }
    it { should validate_presence_of(:start_time) }
  end

  describe 'Origin address' do
    office_address = {
      origin_latitude: 51.520042,
      origin_longitude: -0.098440
    }

    it 'is always Barbican office' do
      expect(subject.origin_latitude).to eq(office_address[:origin_latitude])    
      expect(subject.origin_longitude).to eq(office_address[:origin_longitude])    
    end
  end
end
