class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :business_name, :string
    add_column :users, :business_phone, :string
  end
end
