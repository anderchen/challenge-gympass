require_relative "../views/laps_view"

class LapsController
  def initialize
    @view = LapsView.new
  end

  def index
    # DO NOT WRITE SQL QUERIES
    # TODO: gather all posts from the database
    # TODO: give them to the view to be printed
      all_laps = Lap.all
      @view.show_all_laps(all_laps)
  end
end