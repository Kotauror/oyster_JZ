require 'station'

describe Station do

  subject(:station) {Station.new("name", 1)}


  it "has a name" do
    # station = Station.new("name", 2)
    expect(station.name).to be_a String
  end

  it "has a zone" do
    expect(subject.zone).to be_a Integer
  end

end
