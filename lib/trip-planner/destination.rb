module TripPlanner
  class Destination
    def initialize(distance:)
      @distance = distance
    end

    def distance
      if @distance.miles == 'no results'
        "Unfortunately we can't obtain the distance to this water."
      else
        "You are <strong>#{@distance.miles}</strong> from this water."
      end
    end

    def time_and_mode
      if @distance.in_time == 'no results'
        "Unfortunately we can't obtain the travel time to this water."
      else 
        "It is a <strong>#{@distance.in_time}</strong> drive 🚗 away."
      end
    end
  end
end
