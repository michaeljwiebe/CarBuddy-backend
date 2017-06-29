class CreateCars < ActiveRecord::Migration[5.1]
  def change
    create_table :cars do |t|
      t.string :make_model
      t.integer :year
      t.integer :owner_id
      t.decimal :lat
      t.decimal :lng
      t.integer :price
      t.integer :mpg

      t.timestamps
    end
  end
end
