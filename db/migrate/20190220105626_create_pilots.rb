class CreatePilots < ActiveRecord::Migration[5.1]
  def change
    create_table :pilots do |t|
      t.string :name
      t.integer :pilot_code
      t.timestamps
    end
  end
end