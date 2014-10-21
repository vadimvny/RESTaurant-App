class CreateVisitsParties < ActiveRecord::Migration
  def change
 	create_table :Parties do |t|
 		t.integer :table_number
 		t.integer :num_guests
 		t.boolean :is_paid
 	end
  end
end
