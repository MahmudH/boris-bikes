require 'bike.rb'

describe Bike do
  it { is_expected.to respond_to :working }

  describe '#report_broken' do
    it 'allows users to report a broken bike' do
      subject.report_broken
      expect(subject.broken).to eq true
    end
  end
end
