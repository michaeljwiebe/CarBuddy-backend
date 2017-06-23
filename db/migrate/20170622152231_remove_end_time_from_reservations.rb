class RemoveEndTimeFromReservations < ActiveRecord::Migration[5.1]
  def change
    remove_column :reservations, :end_time, :string
  end
end
