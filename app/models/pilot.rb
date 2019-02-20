class Pilot < ActiveRecord::Base
  has_many :laps

  validates :name, presence: true
  validates :pilot_code, presence:true
end