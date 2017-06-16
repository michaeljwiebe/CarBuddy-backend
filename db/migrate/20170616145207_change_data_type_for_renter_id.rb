class ChangeDataTypeForRenterId < ActiveRecord::Migration[5.1]
  def change
      change_column :reservations, :renter_id, :integer
  end
end
