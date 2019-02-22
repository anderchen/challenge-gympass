require 'csv'


filepath = 'race_log.csv'

CSV.foreach(filepath) do |row|
  pilot = Pilot.new
  pilot.pilot_code = "%02d" % (row[1].to_i)
  pilot.name = row[2]
  pilot.save unless Pilot.find_by(name: row[2])

  lap = Lap.create(time:row[0], lap_number: row[3].to_i, lap_time: row[4], average_speed: row[5].to_f, pilot: Pilot.find_by(name: row[2]))
end

