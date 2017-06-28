class ChangeDataTypeForReservationHours < ActiveRecord::Migration[5.1]
  def change
      change_column :reservations, :reservation_hours, :integer

  end
end
