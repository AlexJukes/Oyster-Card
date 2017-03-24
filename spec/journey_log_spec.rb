require './lib/journey_log.rb'

describe JourneyLog do

  subject(:journey_log) {described_class.new}
  let(:london_bridge) {double :station}
  let(:farringdon) {double :station}


  describe '#initialize' do
      it 'should create an empty array to store the journeys in upon initialization' do
        expect(journey_log.journey_history).to eq []
      end
  end


  describe '#start' do
    it 'store the start of the journey in the history' do
      journey_log.start(london_bridge)
      expect(journey_log.journey_history).not_to be_empty
    end
  end

  describe '#finish' do
    it 'should add the end of the journey to the journey history' do
      # journey_log.start(london_bridge)
      journey_log.finish(farringdon)
      expect(journey_log.journey_history).to include ({:finish => farringdon})
    end

    # it 'allows the user to see what station they touched in at' do
    #   oyster_card.touch_in(london_bridge)
    #   oyster_card.touch_out(bermondsey)
    #   expect(oyster_card.journey_history[0].trip[:start]).to eq london_bridge
    # end

  end
end
