class Lap < ActiveRecord::Base
  belongs_to :pilot

  validates :time, presence: true
  validates :lap_number, presence: true 
  validates :lap_time, presence: true
  validates :average_speed, presence: true
  validates :pilot, presence: true
end