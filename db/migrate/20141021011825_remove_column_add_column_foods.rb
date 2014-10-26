class RemoveColumnAddColumnFoods < ActiveRecord::Migration
  def change
 remove_column :foods, :cuisine, :cents
 add_column :foods, :description, :string
  end
end
