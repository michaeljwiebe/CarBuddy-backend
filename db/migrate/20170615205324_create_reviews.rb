class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :reviewer_id
      t.integer :car_id
      t.string :title
      t.text :description
      t.integer :rating

      t.timestamps
    end
  end
end
