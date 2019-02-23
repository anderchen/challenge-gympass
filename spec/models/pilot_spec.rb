require_relative "../spec_helper"
require_relative "../../app/models/lap"
begin
  require_relative "../../app/models/pilot"
rescue LoadError
end

describe "Pilot" do
  before(:each) do
    create_db
    migrate
  end

  after(:each) { drop_db }

  it "class should exist. If not, you haven't defined your model class yet" do
    expect(defined?(Pilot)).to eq "constant"
  end

  it "has many laps" do
    if defined?(Pilot)
      pilot = Pilot.new(name: "Anderson", pilot_code: "01")
      pilot.save
      lap = Lap.new(time: "23:23:23.123", lap_number: 4, lap_time: "01:01.123", average_speed: 55.123, pilot: pilot)
      lap.save

      expect(Pilot.last.laps).to eq([Lap.last])
    else
      raise "Fix the first test before paying attention to this one"
    end
  end

  it "should have a name" do
    pilot = Pilot.new(pilot_code: 100)
    expect(pilot.valid?).to eq false
    expect(pilot.errors.messages[:name]).to include "can't be blank"
  end

  it "should have a pilot code" do
    pilot = Pilot.new(name: "Anderson")
    expect(pilot.valid?).to eq false
    expect(pilot.errors.messages[:pilot_code]).to include "can't be blank"
  end
end