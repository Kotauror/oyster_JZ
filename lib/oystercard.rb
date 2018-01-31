require_relative 'station'
require_relative 'journey'


class Oystercard

  DEFAULT_BALANCE = 0
  MINIMUM_BALANCE = 1
  DEFAULT_LIMIT = 90
  attr_reader :balance, :journey_history, :current_journey

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @journey_history = []
    @current_journey = nil
  end

  def top_up(amount)
    raise "Maximum balance of #{DEFAULT_LIMIT} exceeded" if (@balance + amount) > DEFAULT_LIMIT
    @balance += amount
  end

  def in_journey?
    !!@entry_station
  end

  def touch_in(station)
    raise "Minimum balance not met" if @balance < MINIMUM_BALANCE
    if @current_journey == nil then
      @current_journey = Journey.new(station)
    else
      puts "You didnt touch out"
    end
  end

  def touch_out(station)
    @current_journey.exit_station = station
    deduct(fare)
    save_journey
    @current_journey = nil
  end

  private

  def fare
    p @current_journey.entry_station
    p @current_journey.exit_station
    if @current_journey.entry_station == nil && @current_journey.exit_station != nil then
      6
    else
      MINIMUM_BALANCE
    end
  end

  def deduct(fare)
    @balance -= fare
  end

  def save_journey
    @journey_history << @current_journey
  end

end
