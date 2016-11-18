class CreatePitches < ActiveRecord::Migration[5.0]
  def change
    create_table :pitches do |t|
      t.string :working_title, null: false, limit: 120
      t.text :description, null: false, limit: 1000

      t.timestamps(null: false)
    end
  end
end
