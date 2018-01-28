class AddStatusToReviewStatuses < ActiveRecord::Migration
  def change
    add_column :review_statuses, :status, :integer, default: 0
  end
end
