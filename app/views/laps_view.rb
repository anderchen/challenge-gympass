class LapsView

  def show_all_laps(all_laps)
    puts "Showing all laps from the race"
    puts "-" * 80
    all_laps.each do |lap|
      puts "#{lap.time}    #{lap.pilot.pilot_code}  #{lap.pilot.name.rjust(15)}   #{lap.lap_number}   #{lap.lap_time}  #{lap.average_speed}"
    end
    puts "-" * 80
  end

  def choosing_pilot
    puts "Choose a pilot by it's code"
    print "> "
    gets.chomp 
  end

  def show_pilot_laps(laps, pilot)
    puts "\nShowing #{pilot.name} laps"
    puts "-" * 80
    laps.each do |lap|
      puts "#{lap.time}    #{lap.pilot.pilot_code}  #{lap.pilot.name.rjust(15)}   #{lap.lap_number}   #{lap.lap_time}  #{lap.average_speed}"
    end
    puts "-" * 80
  end

  def show_pilot_best_lap(best_lap)
    puts "\nThe best lap #{best_lap.pilot.name} did was lap no. #{best_lap.lap_number} in #{best_lap.lap_time} "
  end

  def show_overall_best_lap(best_overall)
    puts "\nThe best lap of the race was made by#{best_overall.pilot.name}, on lap no. #{best_overall.lap_number} in #{best_overall.lap_time} "
  end

  def show_average_speed(average_speed, pilot)
    puts "\n#{pilot.name} average speed in the whole race is #{average_speed}"
  end

end