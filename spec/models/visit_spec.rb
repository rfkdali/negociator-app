require 'rails_helper'

RSpec.describe Visit, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:duration) }
  end
end
