class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|

    	t.string "HomeTeam"
    	t.string "AwayTeam"
    	t.string "Date"
    	t.boolean "Televized"
    	t.string "TVNetwork"

      t.timestamps null: false
    end
  end
end
