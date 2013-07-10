class User < ActiveRecord::Base
	has_secure_password

  	attr_accessible :first_name, :last_name, :password, :email

	has_many :all_books
	has_many :books, :through => :all_books

	validates :first_name, :length     => {:minimum => 2,
                         :too_short  => "must have at least %{count} letters"}

  	validates :last_name,  :length     => {:minimum => 2,
                         :too_short  => "must have at least %{count} letters"}

  	validates :email,      :uniqueness => {:case_sensitive => false,
                         :message    => "has already been taken"},
                         :format     => {:with => /\w{3,}@\w+\.\w{2,3}/,
                         :message    => "must be a valid format" }

  	validate  :password_complexity
  	validates :password,   :length     => {:minimum => 6,
                         :too_short  => "must have at least %{count} characters"}
  	validates_confirmation_of :password

  	def password_complexity
    if password.present? && !password.match(/\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+\z/)
        errors.add :password, "must include at least one lowercase letter, \
                               one uppercase letter, and one digit"
    end
  end
end
