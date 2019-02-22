require_relative "../views/laps_view"

class LapsController
  def initialize
    @view = LapsView.new
  end

  def index
      all_laps = Lap.all
      @view.show_all_laps(all_laps)
  end

  def best_lap
    
  end
end