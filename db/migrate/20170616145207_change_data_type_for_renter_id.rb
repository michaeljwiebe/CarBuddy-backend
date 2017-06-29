class ChangeDataTypeForRenterId < ActiveRecord::Migration[5.1]
  def change
      add_column :reservations, :renter_id, :integer
  end
end
