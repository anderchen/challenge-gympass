require 'csv'


filepath = 'race_log.csv'

CSV.foreach(filepath) do |row|
  pilot = Pilot.new
  pilot.pilot_code = row[1].to_i
  unless Pilot.find_by(pilot_code: row[1])
    pilot.name = row[2]
    pilot.save
  end

  lap = Lap.create(time:row[0], lap_number: row[3].to_i, lap_time: row[4], average_speed: row[5].to_f, pilot: Pilot.find_by(pilot_code: row[1]))
end

