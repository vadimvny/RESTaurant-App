class User < ActiveRecord::Base
	include BCrypt
	has_many :orders
	has_many :foods
	has_many :parties

	def password
		@password || Password.new(self.password_crypted)
	end

	def password=(new_password)
		@password = Password.create(new_password)
		self.password_crypted = @password
	end 
end