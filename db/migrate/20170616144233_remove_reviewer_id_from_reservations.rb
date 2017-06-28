class RemoveReviewerIdFromReservations < ActiveRecord::Migration[5.1]
  def change
    remove_column :reservations, :reviewer_id, :string
  end
end
