FactoryGirl.define do
  factory :itinerary do
    origin_latitude 51.520042
    origin_longitude -0.098440
    destination_latitude 51.517973
    destination_longitude -0.146649
    start_time DateTime.now    
  end
end