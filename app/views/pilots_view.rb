class PilotsView
  def show_all_pilots(all_pilots)
    puts 'Displaying all pilots from the race'
    puts '-' * 20
    all_pilots.each do |pilot|
      puts "#{pilot.pilot_code} - #{pilot.name}"
    end
    puts '-' * 20
  end
end
