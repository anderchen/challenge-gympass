require_relative 'app/controllers/laps_controller'

class Router
  def initialize
    @lapscontroller = LapsController.new
    @running = true
  end

  def run
    print_welcome
    while @running
      print_menu
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @lapscontroller.index
    when 2 then @lapscontroller.winner
    when 3 then @lapscontroller.pilot_laps
    when 4 then @lapscontroller.pilot_best_lap
    when 5 then @lapscontroller.best_lap_overall
    when 6 then @lapscontroller.pilot_average_speed
    when 7 then stop
    else
      puts 'Please input a valid option'
    end
  end

  def actions
    [
      'List the whole race log',
      'Show the final result of the race',
      'See all laps from a pilot',
      'See a pilot best lap',
      'Discover which was the best lap of the race',
      "Show a pilot's average speed",
      'Exit program'
    ]
  end

  def print_menu
    puts "\n--\nWhat do you want to do?"
    actions.each_with_index do |action, index|
      puts "#{index + 1} - #{action}"
    end
    print '> '
  end

  def print_welcome
    puts '-----------------------------'
    puts 'Welcome to the Race Log!'
    puts '-----------------------------'
  end
end

def stop
  @running = false
end
