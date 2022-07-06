module TripPlanner
  class Destination
    def initialize(distance:)
      @distance = distance
    end

    def distance
      "#{@distance.start} is #{@distance.miles} from #{@distance.finish}"
    end

    def time_and_mode
      "It will take you #{@distance.in_time} by car 🚗 and ferry ⛴ to reach your destination."
    end
  end
end
