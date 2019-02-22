class LapsView

  def show_all_laps(all_laps)
    all_laps.each do |lap|
      puts "#{lap.time} #{lap.pilot.pilot_code} #{lap.pilot.name} #{lap.lap_number} #{lap.lap_time} #{lap.average_speed}"
    end
  end
end