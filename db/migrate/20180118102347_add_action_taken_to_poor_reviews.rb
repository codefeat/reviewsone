class AddActionTakenToPoorReviews < ActiveRecord::Migration
  def change
    add_column :poor_reviews, :action_taken, :string
  end
end
