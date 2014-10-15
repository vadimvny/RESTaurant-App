class Food < ActiveRecord::Base
	has_many(:orders)
	has_many(:parties, :through => :orders)
	validates :name, uniqueness: true, length: {in: 2..15}
	validates :description, uniqueness: true 
	def to_s
		"Name: #{name}  Description: #{description} Price: #{price}" 
	end
	def total 
		
	end
end
