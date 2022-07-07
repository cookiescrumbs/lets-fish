module TripPlanner
  class Destination
    def initialize(distance:)
      @distance = distance
    end

    def distance
      "#{@distance.origin_address} is <strong>#{@distance.miles}</strong> from #{@distance.destination_address}."
    end

    def time_and_mode
      "It will take you <strong>#{@distance.in_time}</strong> by car 🚗 to reach #{@distance.destination_address}."
    end
  end
end
