require_relative "../views/laps_view"
require_relative "../views/pilots_view"

class LapsController
  def initialize
    @lapsview = LapsView.new
    @pilotsview = PilotsView.new
  end

  def index
      all_laps = Lap.all
      @lapsview.show_all_laps(all_laps)
  end

  def pilot_laps
    all_pilots = Pilot.all
    @pilotsview.show_all_pilots(all_pilots)
    laps = Lap.where(pilot: Pilot.find_by(pilot_code: @lapsview.choosing_pilot))
    @lapsview.show_pilot_laps(laps)
  end
end