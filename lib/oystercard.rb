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

  def touch_in(station)
    raise "Minimum balance not met" if @balance < MINIMUM_BALANCE
    no_touch_out_guard
    @current_journey = Journey.new
    @current_journey.entry_station = station
  end

  def touch_out(station)
    no_touch_in_guard
    @current_journey.exit_station = station
    deduct(@current_journey.fare)
    save_journey
    end_current_journey
  end

  private

  def no_touch_out_guard
    if @current_journey != nil then
      deduct(@current_journey.fare)
      save_journey
    end
  end

  def no_touch_in_guard
    if @current_journey == nil then
      @current_journey = Journey.new
    end
  end

  def end_current_journey
    @current_journey = nil
  end

  def save_journey
    @journey_history << @current_journey
  end

  def deduct(fare)
    @balance -= fare
  end

end
