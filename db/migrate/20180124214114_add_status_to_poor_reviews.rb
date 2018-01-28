class AddStatusToPoorReviews < ActiveRecord::Migration
  def change
    add_column :poor_reviews, :status, :integer, default: 0
  end
end
