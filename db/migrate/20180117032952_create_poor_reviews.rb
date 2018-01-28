class CreatePoorReviews < ActiveRecord::Migration
  def change
    create_table :poor_reviews do |t|
      t.integer :user_id
      t.integer :invite_id
      t.string :first_name
      t.string :last_name
      t.text :message

      t.timestamps null: false
    end
  end
end
