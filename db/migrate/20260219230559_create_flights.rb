class CreateFlights < ActiveRecord::Migration[8.1]
  def change
    create_table :flights do |t|
      t.integer :num_passengers
      t.datetime :date
      t.references :departing_airport, null: false, foreign_key: { to_table: :airports }
      t.references :arriving_airport, null: false, foreign_key: { to_table: :airports }

      t.timestamps
    end
  end
end
