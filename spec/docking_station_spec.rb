# spec/docking_station_spec.rb
require 'docking_station.rb'
describe DockingStation do

  it  {is_expected.to respond_to :release_bike}

  it 'gets a bike' do
    expect(subject.release_bike).to be_instance_of Bike
  end

  it 'expects bike to be working' do
    docking_station = subject
    bike = docking_station.release_bike
    expect(bike.working?).to eq true
    #expect(subject.release_bike.working?).to eq(true)
  end

it { is_expected.to respond_to(:dock).with(1).argument }
it  {is_expected.to respond_to :bike}

end
