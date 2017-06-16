class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.integer :reviewer_id
      t.integer :car_id
      t.integer :owner_id
      t.string :start_time
      t.string :end_time

      t.timestamps
    end
  end
end
