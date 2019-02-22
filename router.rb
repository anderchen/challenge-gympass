require_relative "app/controllers/pilots_controller"
require_relative "app/controllers/laps_controller"

class Router
  def initialize
    @pilotscontroller = PilotsController.new
    @lapscontroller = LapsController.new
  end

  def run
    print_welcome
    loop do
      print_menu
      action = gets.chomp.to_i
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @pilotscontroller.index
    when 2 then @lapscontroller.index
    # when 3 then @controller.update
    # when 4 then @controller.destroy
    # when 5 then @controller.upvote
    end
  end

  def actions
    [
      "List all pilots",
      "List the all laps",
      "Edit a post title & url",
      "Delete a post",
      "Vote for a post"
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
    puts "Welcome to HackerNewsCopyCat!"
    puts "-----------------------------"
  end
end