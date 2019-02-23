require_relative '../views/laps_view'
require_relative '../views/pilots_view'

class LapsController
  def initialize
    @lapsview = LapsView.new
    @pilotsview = PilotsView.new
  end

  # Getting all the laps from the race log
  def index
    all_laps = Lap.all
    @lapsview.show_all_laps(all_laps)
  end

  # Getting all the last lap of each pilot 
  def winner
    pilots = Pilot.all

    # Getting the last lap of each pilot and putting in an array 
    laps = []
    pilots.each do |pilot|
      final_lap = Lap.where(pilot: pilot).last
      laps << final_lap
    end

    # Sorting all the laps according to their time, in ascending order 
    finished_laps = laps.sort_by(&:time)
    @lapsview.show_winner(finished_laps, time_after_winner(finished_laps), total_race_time)
  end

  # Retrieves the laps of a specific pilot
  def pilot_laps
    display_all_pilots
    @lapsview.show_pilot_laps(find_pilot_and_laps, @pilot)
  end

  # Retrieves the best lap of a specific pilot
  def pilot_best_lap
    display_all_pilots

    best_lap = find_pilot_and_laps.order('lap_time ASC').first
    @lapsview.show_pilot_best_lap(best_lap)
  end

  # Retrieve the best lap of the whole race
  def best_lap_overall
    index
    best_overall = Lap.all.order('lap_time ASC').first
    @lapsview.show_overall_best_lap(best_overall)
  end

  # Calculate the average speed of a specific pilot in the whole race
  def pilot_average_speed
    display_all_pilots

    laps = find_pilot_and_laps

    # Summing all the avg speed 
    average_speed_sum = 0
    laps.each do |lap|
      average_speed_sum += lap.average_speed.to_f
    end
    # The avg speed of the whole game is the sum of avg divided by the number of laps
    average_speed = '%.3f' % (average_speed_sum / laps.count)

    @lapsview.show_average_speed(average_speed, @pilot)
  end

  private
  
  # A private method that gets all the pilots in the database
  def display_all_pilots
    all_pilots = Pilot.all
    @pilotsview.show_all_pilots(all_pilots)
  end

  # A private method that finds all the laps from a specific pilot
  def find_pilot_and_laps
    @pilot = Pilot.find_by(pilot_code: @lapsview.choosing_pilot)
    while @pilot.nil?
      input_option = @lapsview.invalid_option
      @pilot = Pilot.find_by(pilot_code: input_option)
    end
    laps = Lap.where(pilot: @pilot) 
  end

  # Private method that calculates the finishing time after the winner
  # Receives a parameter 'finished_laps' and already ordered in the '#winner'
  def time_after_winner(finished_laps)
    winner = finished_laps[0]
    result = []

    finished_laps.each do |lap|
      if lap == winner
        result << 'Winner!!!'
      elsif lap.lap_number < 4
        result << 'Incomplete'
      else
        winner_parse = Time.parse(winner.time)
        time_parse = Time.parse(lap.time)
        subtraction = time_parse - winner_parse

        after_winner = Time.at(subtraction).strftime('+ %M:%S.%3N')
        result << after_winner
      end
    end
    result
  end

  # Private method that calculates the total time of the race
  def total_race_time
    # Getting the first time, the last time and the first lap
    first_time = Lap.all.order('time ASC').first.time
    end_time = Lap.all.order('time ASC').last.time
    first_lap = "00:#{Lap.all.order('time ASC').first.lap_time}"

    # Parsing all the information above into Time object
    first_time_parse = Time.parse(first_time)
    first_lap_parse = Time.parse(first_lap)
    end_time_parse = Time.parse(end_time)

    # Calculating the intial time of the whole race
    initial_sub = first_time_parse - first_lap_parse
    initial_hour = '%.2d' % (initial_sub / 3600).floor
    initial_minute = '%.2d' % ((initial_sub - initial_hour.to_i * 3600) / 60).floor
    initial_second = '%.2d' % (initial_sub % 60).floor
    initial_ms = initial_sub.to_s.split('.')[1]
    initial_time = initial_hour + ':' + initial_minute + ':' + initial_second + '.' + initial_ms
    initial_time_parse = Time.parse(initial_time)

    # Calculating the total time of the race
    total_sub = end_time_parse - initial_time_parse
    total_hour = '%.2d' % (total_sub / 3600).floor
    total_minute = '%.2d' % ((total_sub - total_hour.to_i * 3600) / 60).floor
    total_second = '%.2d' % (total_sub % 60).floor
    total_ms = total_sub.to_s.split('.')[1]

    total_time = total_hour + ':' + total_minute + ':' + total_second + '.' + total_ms
  end
end
