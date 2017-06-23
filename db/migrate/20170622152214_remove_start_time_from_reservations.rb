class RemoveStartTimeFromReservations < ActiveRecord::Migration[5.1]
  def change
    remove_column :reservations, :start_time, :string
  end
end
