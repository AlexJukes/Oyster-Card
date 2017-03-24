# Responsible topping up, holding balance, and touching in and out.

require './lib/journey.rb'
require './lib/station.rb'

class OysterCard

  MAXIMUM_BALANCE = 90
  INITIAL_BALANCE = 5

attr_reader :balance, :journey_log
# :entry_station, :journey_history, :single_journey,

  def initialize
    @balance = INITIAL_BALANCE
    @journey_log = JourneyLog.new
    # @journey_history = []
  end

  def top_up(amount_of_money)
    fail "Cannot top up: maximum balance (£#{MAXIMUM_BALANCE}) exceeded" if balance_exceeded?(amount_of_money)
    self.balance += amount_of_money
  end

  # changed this
  def touch_in(station)
    calculate_fare unless journey_complete?
    fail "Cannot touch in: insufficient funds. Please top up" if balance_insufficient?
    journey_log.start(station)
  end

  def touch_out(station)
    if journey_complete?
      calculate_fare
    else
      # self.single_journey = Journey.new
      # calculate_fare
      journey_log.add_finish(station)
      calculate_fare
      # finish_trip
    end
  end


  def journey_complete?
      !!journey_log.single_journey
  end

  #
  # def finish_trip
  #   journey_history << single_journey
  # end

  def calculate_fare
    self.balance += journey_log.single_journey.fare
  end


  private

  attr_writer :balance
  #, :entry_station, :single_journey

  def balance_exceeded?(amount_of_money)
    (balance + amount_of_money) > MAXIMUM_BALANCE
  end

  def balance_insufficient?
    balance < 1
  end

end
