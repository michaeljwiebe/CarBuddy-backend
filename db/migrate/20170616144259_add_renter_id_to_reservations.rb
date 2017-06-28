class AddRenterIdToReservations < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :renter_id, :string
  end
end
