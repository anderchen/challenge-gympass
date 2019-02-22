class LapsView

  def show_all_laps(all_laps)
    puts "Showing all laps from the race"
    puts "-" * 80
    all_laps.each do |lap|
      puts "#{lap.time}    #{lap.pilot.pilot_code}  #{lap.pilot.name.rjust(15)}   #{lap.lap_number}   #{lap.lap_time}  #{lap.average_speed}"
    end
    puts "-" * 80
  end
end