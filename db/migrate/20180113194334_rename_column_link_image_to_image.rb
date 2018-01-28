class RenameColumnLinkImageToImage < ActiveRecord::Migration
  def change
  	rename_column :links, :link_image, :image
  end
end
