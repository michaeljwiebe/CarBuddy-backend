class AddAvatarToCars < ActiveRecord::Migration[5.1]
  def change
    add_column :cars, :avatar, :binary
  end
end
