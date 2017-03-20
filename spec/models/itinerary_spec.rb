require 'rails_helper'

RSpec.describe Itinerary, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:destination_latitude) }
    it { should validate_presence_of(:destination_longitude) }
    it { should validate_presence_of(:start_time) }
  end
end
