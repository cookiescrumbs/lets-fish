module TripPlanner
  class Destination
    def initialize(distance:)
      @distance = distance
    end

    def distance
      "You are <strong>#{@distance.miles}</strong> from this water."
    end

    def time_and_mode
      "It is a <strong>#{@distance.in_time}</strong> drive 🚗 away."
    end
  end
end
