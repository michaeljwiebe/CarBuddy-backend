class RemoveOwnerIdFromReviews < ActiveRecord::Migration[5.1]
  def change
    remove_column :reviews, :owner_id, :string
  end
end
