class RenameZipcodeToBusinessZipcode < ActiveRecord::Migration
  def change
  	rename_column :users, :zipcode, :business_zipcode
  end
end
