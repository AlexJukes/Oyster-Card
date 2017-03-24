# Journey log is responsible for holding a complete journey history of an Oyster Card.
require './lib/journey.rb'

class JourneyLog

  attr_reader :journey_history, :single_journey

    def initialize
      @journey_history = []
      @single_journey
    end

 # We need to:
    # create new individual journey
    # store individual journey in journey history

    def start(station)
      self.single_journey = Journey.new
      single_journey.add_start(station)
      log_journey
    end

    def finish(station)
      self.single_journey = Journey.new if single_journey.nil?
      single_journey.add_finish(station)
      # log_journey
      reset
    end

    def reset
      self.single_journey = nil
    end

    def log_journey
      self.journey_history << single_journey.trip
    end

    private

    attr_writer :single_journey

end
