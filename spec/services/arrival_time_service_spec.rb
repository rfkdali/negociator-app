require 'rails_helper'

RSpec.describe "ArrivalTimeService" do
  describe "First visit" do
    let(:subject) { ArrivalTimeService.new(@visit) }
    
    before do
      @itinerary = FactoryGirl.create(:itinerary, start_time: Time.new(2015, 10, 02))
      @visit = @itinerary.visits.create(address: "N80LJ", duration: 16)
      allow(subject).to receive(:get_travel_time).and_return(33.minutes)
    end

    it "uses travel_time method to calculate travel time between 2 addresses" do
      expect(subject.get_travel_time).to eq(33.minutes)  
    end

    it "return nil for itinerary arrival_time" do
      expect(@itinerary.arrival_time.nil?).to be_truthy
    end

    it "updates arrival_time if service is called" do
      subject.call
      expect(@itinerary.arrival_time.nil?).to be_falsy
      expect(@itinerary.arrival_time).to eq(@itinerary.start_time + 33.minutes)
    end
  end

  describe "Second visit" do
    let(:subject_first) { ArrivalTimeService.new(@first_visit) }
    let(:subject_second) { ArrivalTimeService.new(@second_visit) }

    before do
      @itinerary = FactoryGirl.create(:itinerary, 
        start_time: Time.new(2015, 10, 03))
      @first_visit = @itinerary.visits.create(address: "N80LJ", duration: 16)
      allow(subject_first).to receive(:get_travel_time).and_return(33.minutes)
      subject_first.call

      @second_visit = @itinerary.visits.create(address: "N70LJ", duration: 19)
      allow(subject_second).to receive(:get_travel_time).and_return(45.minutes)
    end

    it "updates arrival_time if service is called" do
      subject_second.call
      expect(@itinerary.arrival_time).to eq(@first_visit.arrival_time + 45.minutes + @first_visit.duration.minutes )
    end
  end
end