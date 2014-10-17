class Party < ActiveRecord::Base
	has_many(:orders)
	has_many(:foods, :through => :orders)
end

def counter (count)
	count = 0
	while count < 15
		count += 1
	end
end