require_relative "../../../lib/trip-planner/distance"
require "httparty"

describe TripPlanner::Distance, test: "small" do
  describe "#miles" do
    let(:start) { "OL5 9BT" }
    let(:finish) { "Jura, Scotland" }
    let(:miles) { "364 miles" }
    let(:api_key) { "AN_API_KEY" }

    context "Successful response" do
      let(:response) { instance_double("HTTParty::Response", body: successful.to_json, code: 200) }
      let(:http) { class_double("HTTParty", get: response) }
      subject { TripPlanner::Distance.new(start: start, finish: finish, http: http, api_key: api_key) }
      it "returns the number of miles as a string" do
        expect(subject.miles).to eql miles
      end
      it "returns the duration of travel as a string" do
        expect(subject.duration).to eql "9 hours 40 mins"
      end
    end

    context "Unsuccessful response" do
      describe "incorrect API key" do
        let(:response) { instance_double("HTTParty::Response", body: incorrect_api_key.to_json, code: 200) }
        let(:http) { class_double("HTTParty", get: response) }
        subject { TripPlanner::Distance.new(start: start, finish: finish, http: http, api_key: api_key) }
        it "raises an error - invalide API key" do
          expect { subject.miles }.to raise_error HttpAPIError, "error: The provided API key is invalid., code: 200"
        end
      end

      describe "Any HTTP status code other than a 200" do
        let(:response) { instance_double("HTTParty::Response", body: {}.to_json, code: 402) }
        let(:http) { class_double("HTTParty", get: response) }
        subject { TripPlanner::Distance.new(start: start, finish: finish, http: http, api_key: api_key) }
        it "raises an error" do
          expect { subject.miles }.to raise_error HttpAPIError, "error: unsuccessful response, code: 402"
        end
      end
    end
  end
end

def incorrect_api_key
  {
    "destination_addresses" => [],
    "error_message" => "The provided API key is invalid.",
    "origin_addresses" => [],
    "rows" => [],
    "status" => "REQUEST_DENIED"
  }
end

def successful
  {
    "destination_addresses" => [
      "Jura, Isle of Jura, UK"
    ],
    "origin_addresses" => [
      "Huddersfield Rd, Mossley, Ashton-under-Lyne OL5 9BT, UK"
    ],
    "rows" => [
      {
        "elements" => [
          {
            "distance" => {
              "text" => "364 mi",
              "value" => 586575
            },
            "duration" => {
              "text" => "9 hours 40 mins",
              "value" => 34780
            },
            "status" => "OK"
          }
        ]
      }
    ],
    "status" => "OK"
  }
end
