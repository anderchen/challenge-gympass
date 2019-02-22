require_relative "app/controllers/pilots_controller"
require_relative "app/controllers/laps_controller"

class Router
  def initialize
    @pilotscontroller = PilotsController.new
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
    when 1 then @pilotscontroller.index
    when 2 then @lapscontroller.index
    when 3 then @lapscontroller.pilot_laps
    when 4 then stop
    end
  end

  def actions
    [
      "List all pilots",
      "List the all laps",
      "See all laps from a pilot",
      "Exit program"
    ]
  end

  def print_menu
    puts "\n--\nWhat do you want to do?"
    actions.each_with_index do |action, index|
      puts "#{index + 1} - #{action}"
    end
    print "> "
  end

  def print_welcome
    puts "-----------------------------"
    puts "Welcome to the race log!"
    puts "-----------------------------"
  end
end

def stop
  @running = false
end