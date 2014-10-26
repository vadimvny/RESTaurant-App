class CreateTableUsers < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :username, null: false
  		t.string :password_crypted, null: false
  	end
	end
end
