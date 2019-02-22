# require 'Time'
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

  def pilot_average_speed
    display_all_pilots

    laps = find_pilot_and_laps

    average_speed_sum = 0
    laps.each do |lap|
      average_speed_sum += lap.average_speed.to_f
    end

    average_speed = '%.3f' % (average_speed_sum / laps.count)

    @lapsview.show_average_speed(average_speed, @pilot)
  end

  def winner
    finished_laps = Lap.where(lap_number: 4).order('time ASC')
    winner = finished_laps.first
    
    @lapsview.show_winner(finished_laps, winner, time_after_winner(finished_laps, winner))
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

  def time_after_winner(finished_laps, winner)
    result = []
    finished_laps.each do |lap|
      unless lap == winner
        winner_parse = Time.parse(winner.time)
        time_parse = Time.parse(lap.time)
        subtraction = time_parse - winner_parse

        after_winner = Time.at(subtraction).strftime("%M:%S.%3N")
        result << after_winner
      end
    end
    result
  end
end