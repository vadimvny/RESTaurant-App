class ChangeFoodNameToCuisine < ActiveRecord::Migration
  def change
  rename_column :foods, :food_names, :cuisine 
  end
end
