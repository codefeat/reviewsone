class CreateReviewStatuses < ActiveRecord::Migration
  def change
    create_table :review_statuses do |t|
      t.integer :user_id
      t.integer :feedback_id
      t.string :note

      t.timestamps null: false
    end
  end
end
