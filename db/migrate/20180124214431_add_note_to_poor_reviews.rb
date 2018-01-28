class AddNoteToPoorReviews < ActiveRecord::Migration
  def change
    add_column :poor_reviews, :note, :string
  end
end
