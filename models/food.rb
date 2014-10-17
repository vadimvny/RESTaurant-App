class Food < ActiveRecord::Base
	has_many(:orders)
	has_many(:parties, :through => :orders)
	validates :name, uniqueness: true, length: {in: 1..15}
	validates :description, uniqueness: true 
	
	def to_s
		"Name: #{food.name}  Description: #{food.description} Price: #{food.price}" 
	end
end
