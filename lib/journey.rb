require_relative 'station'
require_relative 'oystercard'

class Journey

  MINIMUM_BALANCE = 1
  PENALTY = 6 * MINIMUM_BALANCE

  attr_accessor :exit_station, :entry_station

  def initialize
    @entry_station = nil
    @exit_station = nil
  end

  def fare
    if @entry_station != nil && @exit_station != nil then
      calculate_fare
    else
      PENALTY
    end
  end

  private

  def calculate_fare
    arr_of_zones = [@entry_station.zone, @exit_station.zone]
    arr_of_zones.sort.reverse.inject(:-) + MINIMUM_BALANCE
  end

end
