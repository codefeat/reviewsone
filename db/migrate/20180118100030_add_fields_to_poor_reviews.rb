class AddFieldsToPoorReviews < ActiveRecord::Migration
  def change
    add_column :poor_reviews, :phone, :string
    add_column :poor_reviews, :ip_address, :string
  end
end
