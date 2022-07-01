module TripPlanner
  class Distance
    @@base = "maps.googleapis.com"

    attr_reader :start, :finish

    def initialize(start:, finish:, http:, api_key:)
      @start = start
      @finish = finish
      @api_key = api_key
      @parsed_body = parse_body get_response(http)
    end

    def miles
      @parsed_body["rows"].first["elements"].first["distance"]["text"] + "les"
    end

    def duration
      @parsed_body["rows"].first["elements"].first["duration"]["text"]
    end

    private

    def get_response(http)
      response = http.get url
      raise HttpAPIError.new("unsuccessful response", code: response.code) if response.code != 200
      response
    end

    def url
      "https://#{@@base}/maps/api/distancematrix/json?units=imperial&destinations=#{@finish}&origins=#{@start}&key=#{@api_key}".gsub(/[[:space:]]/, "")
    end

    def parse_body(response)
      parsed_body = JSON.parse response.body
      raise HttpAPIError.new(parsed_body["error_message"], code: response.code) if parsed_body["rows"] && parsed_body["rows"].length == 0
      parsed_body
    end
  end
end

class HttpAPIError < StandardError
  def initialize(message, code:)
    super("error: #{message}, code: #{code}")
  end
end
