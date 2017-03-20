require 'rails_helper'

RSpec.feature "Creating itineraries", type: :feature do
  scenario 'Create a new itinerary' do
    visit '/'
    click_link 'New Itinerary'
    expect(page).to have_content('Start time:')
  end
end