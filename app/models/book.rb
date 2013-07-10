class Book < ActiveRecord::Base
  attr_accessible :author, :title, :rating
  has_many :all_books
  has_many :users, :through => :all_books
  validates :title, :author, :presence => true
end
