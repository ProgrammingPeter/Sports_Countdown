class CreateDivisions < ActiveRecord::Migration
  def change
    create_table :divisions do |t|
      t.integer "conference_id"

      t.string "name"

      t.timestamps null: false
    end
    add_index :divisions, "conference_id"
  end
end
