# spec/docking_station_spec.rb
require 'docking_station.rb'
describe DockingStation do

it  {expect(subject.respond_to? "release_bike").to be_truthy}
it {expect((subject.release_bike).working?).to be true}

end
