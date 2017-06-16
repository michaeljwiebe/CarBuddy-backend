class AddMakeModelToCars < ActiveRecord::Migration[5.1]
  def change
    add_column :cars, :make_model, :string
  end
end
