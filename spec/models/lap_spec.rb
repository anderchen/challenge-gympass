require_relative "../spec_helper"
require_relative "../../app/models/lap"
begin
  require_relative "../../app/models/pilot"
rescue LoadError
end

describe "Lap" do
  before(:each) do
    create_db
    migrate
  end

  after(:each) { drop_db }

  it "belongs to a Pilot" do
    if defined?(Pilot)
      pilot = Pilot.new(name: "Chen", pilot_code: 38)
      pilot.save
      lap = Lap.new(time: "23:23:23.123", lap_number: 4, lap_time: "01:01.123", average_speed: 55.123, pilot: pilot)
      lap.save

      expect(Lap.last.pilot).to eq(Pilot.last)
    else
      raise "Fix the Pilot tests before paying attention to this one"
    end
  end

  it "should have a time" do
    pilot = Pilot.new(name: "Chen", pilot_code: 38)
    pilot.save
    lap = Lap.new(lap_number: 4, lap_time: "01:01.123", average_speed: 55.123, pilot: pilot)
    expect(lap.valid?).to eq false
    expect(lap.errors.messages[:time]).to include "can't be blank"
  end

  it "should have a lap number" do
    pilot = Pilot.new(name: "Chen", pilot_code: 38)
    pilot.save
    lap = Lap.new(time: "23:23:23.123", lap_time: "01:01.123", average_speed: 55.123, pilot: pilot)
    expect(lap.valid?).to eq false
    expect(lap.errors.messages[:lap_number]).to include "can't be blank"
  end

  it "should have a lap time" do
    pilot = Pilot.new(name: "Chen", pilot_code: 38)
    pilot.save
    lap = Lap.new(time: "23:23:23.123", lap_number: 4, average_speed: 55.123, pilot: pilot)
    expect(lap.valid?).to eq false
    expect(lap.errors.messages[:lap_time]).to include "can't be blank"
  end

  it "should have an average speed" do
    pilot = Pilot.new(name: "Chen", pilot_code: 38)
    pilot.save
    lap = Lap.new(time: "23:23:23.123", lap_number: 4, lap_time: "01:01.123", pilot: pilot)
    expect(lap.valid?).to eq false
    expect(lap.errors.messages[:average_speed]).to include "can't be blank"
  end

  it "should have an pilot" do
    lap = Lap.new(time: "23:23:23.123", lap_number: 4, lap_time: "01:01.123", average_speed: 55.123)
    expect(lap.valid?).to eq false
    expect(lap.errors.messages[:pilot]).to include "can't be blank"
  end
end