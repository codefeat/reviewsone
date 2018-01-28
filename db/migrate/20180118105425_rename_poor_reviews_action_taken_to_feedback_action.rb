class RenamePoorReviewsActionTakenToFeedbackAction < ActiveRecord::Migration
  def change
  	rename_column :poor_reviews, :action_taken, :feedback_action
  end
end
