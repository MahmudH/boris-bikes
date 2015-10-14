require_relative 'bike'

class DockingStation

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail "No bikes available" if @bikes.empty?
    @bikes.pop
  end

  def dock bike
    fail "No space to dock" if @bikes.count == 20
    @bikes << bike
    # @bikes.last
  end
end
