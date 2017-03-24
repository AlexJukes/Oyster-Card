
# Be responsible for storing information on single journeys, including beginning and end station (where available)

class Journey

  MINIMUM_FARE = -1
  PENALTY_FARE = -6

  attr_reader :fare, :complete

  def initialize
    @trip = {}
    @fare = PENALTY_FARE
  end

  attr_reader :start, :finish, :trip

  def add_start(station)
    self.trip[:start] = station
  end

  def add_finish(station)
    self.trip[:finish] = station
    self.fare = MINIMUM_FARE
  end

  private

  attr_writer :start, :finish, :trip, :fare, :complete
end
