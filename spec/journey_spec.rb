require 'journey'

describe Journey do

  subject(:journey) {described_class.new(:entry_station)}

  it "stores the entry station on creation" do
    expect(journey.entry_station).to be :entry_station
  end


end
