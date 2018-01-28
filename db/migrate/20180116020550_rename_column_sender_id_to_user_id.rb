class RenameColumnSenderIdToUserId < ActiveRecord::Migration
  def change
  	rename_column :invites, :sender_id, :user_id
  end
end
