class CreateVisitsParties < ActiveRecord::Migration
  def change
 	create_table :Parties do |t|
 		t.integer :table_number
 		t.integer :num_guests
 		t.string :name
 		t.boolean :is_paid, default:false
 	end
  end
end
