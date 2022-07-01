require_relative "../../../lib/trip-planner/destination"
require_relative "../../../lib/trip-planner/distance"

describe TripPlanner::Destination, test: "small" do
    let(:start) { "OL5 9BT" }
    let(:finish) { "Jura, Scotland" }
    let(:miles) { "364 miles" }
    let(:duration)  { "9 hours 42 mins" }
    let(:distance) { instance_double("TripPlanner::Distance", miles: miles, start: start, finish: finish, duration: duration) }
    subject { TripPlanner::Destination.new(distance: distance) }
  describe "#distance" do
    it "returns a sentence containing the distance from the start to the finish" do
      expect(subject.distance).to eql "#{start} is #{miles} from #{finish}"
    end
  end
  describe '#time_and_mode' do
    it 'returns a sentence containing the travel time and the mode of travel' do
      expect(subject.time_and_mode).to eql "It will take #{duration} by car 🚗 and ferry ⛴"
    end
  end
end
