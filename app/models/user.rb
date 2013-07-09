class User < ActiveRecord::Base
	has_secure_password

  	attr_accessible :first_name, :last_name, :password, :email

	has_many :all_books
	has_many :books, :through => :all_books
end
