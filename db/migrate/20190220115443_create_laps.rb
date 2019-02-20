class CreateLaps < ActiveRecord::Migration[5.1]
  def change
    create_table :laps do |t|
      t.datetime :time
      t.integer :lap_number
      t.datetime :lap_time
      t.float :average_speed
      t.timestamps
    end
  end
end