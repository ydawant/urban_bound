class AllBook < ActiveRecord::Base
	attr_accessible :book_id, :user_id, :rating
  belongs_to :user
  belongs_to :book
end
