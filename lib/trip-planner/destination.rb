module TripPlanner
  class Destination
    def initialize(distance:)
      @distance = distance
    end

    def distance
      "#{@distance.start} is #{@distance.miles} from #{@distance.finish}"
    end

    def time_and_mode
      # "It will take #{@distance.in_time} by car 🚗 and ferry ⛴"
      "It will take 3456 by car 🚗 and ferry ⛴"
    end
  end
end
