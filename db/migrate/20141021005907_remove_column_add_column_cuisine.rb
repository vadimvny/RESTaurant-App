class RemoveColumnAddColumnCuisine < ActiveRecord::Migration
  def change
  	remove_column :foods, :cuisine
  	add_column :foods, :cuisine, :string
  end
end
