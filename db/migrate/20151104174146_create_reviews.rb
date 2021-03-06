class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :movie_id, null: false
      t.string :email, null: false
      t.integer :rating, null: false
      t.text :comment
      t.timestamps null: false
    end
  end
end
