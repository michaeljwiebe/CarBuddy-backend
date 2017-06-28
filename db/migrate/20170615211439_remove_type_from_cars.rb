class RemoveTypeFromCars < ActiveRecord::Migration[5.1]
  def change
    remove_column :cars, :type, :string
  end
end
