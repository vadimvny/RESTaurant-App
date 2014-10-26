class AddColumnnPrice < ActiveRecord::Migration
  def change
 	add_column :foods, :price, :integer
  end
end
