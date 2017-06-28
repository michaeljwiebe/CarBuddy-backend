class ChangeDataTypeForAvatar < ActiveRecord::Migration[5.1]
  def change
      change_column :users, :avatar, :binary
  end
end
