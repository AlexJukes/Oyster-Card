require 'journey'

describe Journey do
  let(:entry_station) {double :entry_station}
  let(:exit_station) {double :exit_station}
  subject(:journey) {described_class.new}

  describe '#add_start' do
    it 'adds a station to the start of the journey' do
      journey.add_start(entry_station)
      expect(journey.trip[:start]).to eq entry_station
    end
  end

  describe '#add_finish' do
    it 'adds a station to the end of the journey' do
      journey.add_finish(exit_station)
      expect(journey.trip).to include {{:finish => exit_station}}
      end
    end

end


# does not add finished trip info
