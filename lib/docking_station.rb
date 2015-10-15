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
    @bikes.pop
  end

  def dock bike
    fail "No space to dock" if full?
    @bikes << bike
    # @bikes.last
  end

  private

    def full?
      @bikes.count >= @capacity ? true : false
    end
    def empty?
      @bikes.empty? ? true : false
    end


end
