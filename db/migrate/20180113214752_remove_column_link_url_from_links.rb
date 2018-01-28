class RemoveColumnLinkUrlFromLinks < ActiveRecord::Migration
  def change
  	remove_column :links, :link_url
  end
end
