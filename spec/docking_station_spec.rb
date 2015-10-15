# spec/docking_station_spec.rb
require 'docking_station'
describe DockingStation do
  let(:bike) {double(:bike, {report_broken: true})}

  it  {is_expected.to respond_to :release_bike}

  describe '#release_bike' do
    it 'gets a bike' do
      # bike = Bike.new
      subject.dock bike #double(:bike)
      last_bike = subject.bikes.last
      expect(subject.release_bike).to eq last_bike
    end
    it 'does not release a bike if the bike is broken' do
      # bike = double(:bike)
      docking_station = DockingStation.new
      bike.report_broken
      docking_station.dock(bike)
      expect{ docking_station.release_bike }.to raise_error "No working bikes available"
    end
    it 'it only releases working bikes, even if there are broken ones' do
      docking_station = DockingStation.new
      2.times { docking_station.dock bike } #double bike
      # bike = double(:bike)
      bike.report_broken
      docking_station.dock(bike)
      expect{ 3.times { docking_station.release_bike} }.to raise_error "No working bikes available"
    end
  end

  it "raise an error when trying to take out a bike if it's empty" do

    expect{ subject.release_bike }.to raise_error "No bikes available"
  end

  it "test if a new bike is working" do
    # allow(:bike).to receive(:working).and_return(true)
    # bike = double(:bike)
    expect(bike.working).to eq true
  end

  #it {is_expected.to respond_to(:dock).with(1).argument }

  it "be able to dock a bike" do
    #bike = double(:bike)
    bikes = []
    bikes << bike
    expect(subject.dock(bike)).to eq bikes
  end

  it "raise an error when trying to dock a bike and the station is full, at default capacity" do
      #bike = double(:bike)
      DockingStation::DEFAULT_CAPACITY.times { subject.dock double(:bike) }
      # subject.dock(bike)
      expect{ subject.dock(bike) }.to raise_error "No space to dock"
  end
  it "raises an error when trying to dock a bike and the station is full - variable capacity" do
      #bike = double(:bike)
      docking_station = DockingStation.new(30)
      30.times { docking_station.dock bike } #double bike
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
    # describe '#dock' do
    #   # it {is_expected.to respond_to(:dock).with(1).argument }
    #   it 'allows a user to report a broken bike when docking' do
    #     bike = double(:bike)
    #     expect(subject.dock(bike).last.working).to eq false
    #   end
    # end
end
