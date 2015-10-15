require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :bikes

  def initialize
    @bikes = []
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
      @bikes.count >= DEFAULT_CAPACITY ? true : false
    end
    def empty?
      @bikes.empty? ? true : false
    end


end
