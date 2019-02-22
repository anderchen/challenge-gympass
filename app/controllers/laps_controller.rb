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
    display_all_pilots
    @lapsview.show_pilot_laps(find_pilot_and_laps, @pilot)
  end

  def pilot_best_lap
    display_all_pilots

    best_lap = find_pilot_and_laps.order('lap_time ASC').first
    @lapsview.show_pilot_best_lap(best_lap)
  end

  def best_lap_overall
    index
    best_overall = Lap.all.order('lap_time ASC').first
    @lapsview.show_overall_best_lap(best_overall)
  end

  private
  def display_all_pilots
    all_pilots = Pilot.all
    @pilotsview.show_all_pilots(all_pilots)
  end

  def find_pilot_and_laps
    @pilot = Pilot.find_by(pilot_code: @lapsview.choosing_pilot)
    laps = Lap.where(pilot: @pilot) 
  end
end