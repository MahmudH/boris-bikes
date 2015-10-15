# spec/docking_station_spec.rb
require 'docking_station'
describe DockingStation do

  it  {is_expected.to respond_to :release_bike}

  it 'gets a bike' do
    #bike = Bike.new
    subject.dock(Bike.new)
    last_bike = subject.bikes.last
    expect(subject.release_bike).to eq last_bike
  end

  it "raise an error when trying to take out a bike if it's empty" do

    expect{ subject.release_bike }.to raise_error "No bikes available"
  end

  it "test if bike works" do
    bike = Bike.new
    expect(bike).to be_working
  end

  it {is_expected.to respond_to(:dock).with(1).argument }

  it "be able to dock a bike" do
    bike = Bike.new
    bikes = []
    bikes << bike
    expect(subject.dock(bike)).to eq bikes
  end

  it "raise an error when trying to dock a bike and the station is full, at default capacity" do
      bike = Bike.new
      DockingStation::DEFAULT_CAPACITY.times { subject.dock Bike.new }
      # subject.dock(bike)
      expect{ subject.dock(bike) }.to raise_error "No space to dock"
  end
  it "raises an error when trying to dock a bike and the station is full - variable capacity" do
      bike = Bike.new
      docking_station = DockingStation.new(30)
      30.times { docking_station.dock Bike.new }
      expect{ docking_station.dock(bike) }.to raise_error "No space to dock"
  end
    describe '#initialize' do
      it 'initialises with a variable capacity' do
        expect(DockingStation).to respond_to(:new).with(1).argument
      end
      it 'initializes with a default capacity of 20' do
        expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
      end
    end
end