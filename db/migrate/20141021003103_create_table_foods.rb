class CreateTableFoods < ActiveRecord::Migration
  def change
 	create_table :foods do |t|
 		t.integer :food_names
 		t.string :name
 		t.integer :cents
 	end
  end
end
