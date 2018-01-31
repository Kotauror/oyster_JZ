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
      MINIMUM_BALANCE
    else
      PENALTY
    end
  end

end
