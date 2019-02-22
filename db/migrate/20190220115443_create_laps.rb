class CreateLaps < ActiveRecord::Migration[5.1]
  def change
    create_table :laps do |t|
      t.string :time
      t.integer :lap_number
      t.string :lap_time
      t.float :average_speed
      t.references :pilot, foreign_key: true
      t.timestamps
    end
  end
end