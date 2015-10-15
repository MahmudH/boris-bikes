require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :bikes, :capacity

  def initialize(num_bikes=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = num_bikes
  end

  def release_bike
    fail "No bikes available" if empty?
    fail 'No working bikes available' if no_working_bikes?
    last_bike_working
    @bikes.pop
  end

  def dock bike
    fail "No space to dock" if full?
    @bikes << bike
    # @bikes.last
  end

  # def dock bike, condition=true
  #   fail "No space to dock" if full?
  #   if condition == :broken
  #     broken bike
  #   end
  #   @bikes << bike
  #   # @bikes.last
  # end

  # def broken bike
  #   bike.working =false
  # end

  private

    def full?
      @bikes.count >= @capacity ? true : false
    end
    def empty?
      @bikes.empty? ? true : false
    end

    def no_working_bikes?
      @bikes.all?{|bike| bike.broken } ? true : false
    end
    def last_bike_working
      while @bikes[-1].broken and not no_working_bikes?
        @bikes.rotate![-1]
      end
    end
end
