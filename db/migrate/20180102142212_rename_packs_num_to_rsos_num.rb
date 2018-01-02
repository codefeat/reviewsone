class RenamePacksNumToRsosNum < ActiveRecord::Migration
  def change
  	rename_column :users, :packs_num, :rsos_num
  end
end
