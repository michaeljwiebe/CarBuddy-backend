class RemoveOwnerIdFromReservations < ActiveRecord::Migration[5.1]
  def change
    remove_column :reservations, :owner_id, :string
  end
end
