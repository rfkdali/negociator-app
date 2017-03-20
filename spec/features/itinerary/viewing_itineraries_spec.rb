require 'rails_helper'

RSpec.feature "Viewing itineraries", type: :feature do
  scenario 'list all itineraries' do
    datetime = "30/Nov/2016 16:29:30".to_datetime.utc
    itinerary = FactoryGirl.create(:itinerary, start_time: datetime)
    
    visit '/'

    expect(page).to have_content('Itineraries')
    expect(page).to have_content(datetime)
  end

  scenario 'ability to create a new itinerary' do
    visit '/'
    expect(page).to have_content('New Itinerary')
  end
end


