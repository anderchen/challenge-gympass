class LapsView
  def show_all_laps(all_laps)

    puts 'Showing all laps from the race'
    puts '-' * 100
    title
    puts '-' * 100
    all_laps.each do |lap|
      puts lap.time + ' ' * 10 + lap.pilot.pilot_code + ' ' * 10 + lap.pilot.name.rjust(15) + ' ' * 10 + "#{lap.lap_number}" + ' ' * 10 + lap.lap_time + ' ' * 10 + "#{lap.average_speed}"
    end
    puts '-' * 100
  end

  def show_winner(finsihed_laps, time_after_winner, total_race_time)
    counter = 1
    puts 'Final Result of the Race'
    puts '-' * 100
    puts 'Rank' + ' ' * 10 + 'Pilot Code' + ' ' * 10 + 'Pilot Name' + ' ' * 10 + 'Number of Laps' + ' ' * 10 + 'Time After Winner'
    puts '-' * 100
    finsihed_laps.each do |lap|
      puts "#{counter} place:" + ' ' * 10 + lap.pilot.pilot_code + ' ' * 10 + lap.pilot.name.rjust(15) + ' ' * 15 + "#{lap.lap_number}" + ' ' * 18 + "#{time_after_winner[counter - 1]}"
      counter += 1
    end
    puts ''
    puts "The total race time is #{total_race_time}"
    puts '-' * 100
  end

  def choosing_pilot
    puts "Choose a pilot by it's code"
    print '> '
    gets.chomp
  end

  def show_pilot_laps(laps, pilot)
    puts "\nShowing #{pilot.name} laps"
    puts ''
    title
    puts '-' * 100
    laps.each do |lap|
      puts lap.time + ' ' * 10 + lap.pilot.pilot_code + ' ' * 10 + lap.pilot.name.rjust(15) +  ' ' * 10 + "#{lap.lap_number}" + '' * 10 + lap.lap_time + ' ' * 10 + "#{lap.average_speed}"
    end
    puts '-' * 100
  end

  def show_pilot_best_lap(best_lap)
    puts '-' * 70
    puts "\nThe best lap #{best_lap.pilot.name} did was lap no. #{best_lap.lap_number} in #{best_lap.lap_time} "
    puts '-' * 70
  end

  def show_overall_best_lap(best_overall)
    puts '-' * 80
    puts "\nThe best lap of the WHOLE race was made by#{best_overall.pilot.name}, on lap no. #{best_overall.lap_number} in #{best_overall.lap_time} "
    puts '-' * 80
  end

  def show_average_speed(average_speed, pilot)
    puts '-' * 70
    puts "\n#{pilot.name} average speed in the whole race is #{average_speed}"
    puts '-' * 70
  end

  def title
    puts 'Time' + ' ' * 13 + 'Pilot Code' + ' ' * 15 + 'Name' + ' ' * 9 + 'Lap Number' + ' ' * 4 + 'Lap Time' + ' ' * 7 + 'Lap Avg Speed'
  end

  def invalid_option
    puts "Please choose an option from above!!"
    puts ''
    choosing_pilot
  end
end
