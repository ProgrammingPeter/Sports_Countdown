class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer "division_id"


      t.string "FullName"
      t.string "city"

      t.timestamps null: false
    end
    add_index :teams, "division_id"
  end
end
