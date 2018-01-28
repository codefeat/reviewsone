class AddEmailToPoorReviews < ActiveRecord::Migration
  def change
    add_column :poor_reviews, :email, :string
  end
end
