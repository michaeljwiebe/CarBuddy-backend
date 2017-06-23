class AddReservationHoursToReservations < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :reservation_hours, :string
  end
end
