class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.integer :renter_id
      t.integer :car_id
      t.integer :reservation_hours
      t.string :start_date
      t.string :end_date

      t.timestamps
    end
  end
end
