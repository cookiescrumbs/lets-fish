require_relative "../../../lib/trip-planner/destination"
require_relative "../../../lib/trip-planner/distance"

describe TripPlanner::Destination, test: "small" do
    let(:start) { "OL5 9BT" }
    let(:finish) { "Jura, Scotland" }
    let(:destination_address) { "Jura, Scotland" }
    let(:origin_address) { "Huddersfield Rd, Mossley, Ashton-under-Lyne OL5 9BT, UK" }
    let(:miles) { "364 miles" }
    let(:time)  { "9 hours 42 mins" }
    let(:distance) do 
      instance_double("TripPlanner::Distance",
        miles: miles, 
        in_time: time, 
        destination_address: destination_address,
        origin_address: origin_address
      ) 
    end
    subject { TripPlanner::Destination.new(distance: distance) }
  describe "#distance" do
    it "returns a sentence containing the distance from the start to the finish" do
      
      expect(subject.distance).to eql "#{origin_address} is <strong>#{miles}</strong> from #{destination_address}."
    end
  end
  describe '#time_and_mode' do
    it 'returns a sentence containing the travel time and the mode of travel' do
      expect(subject.time_and_mode).to eql "It will take you <strong>#{time}</strong> by car 🚗 to reach #{destination_address}."
    end
  end
end
