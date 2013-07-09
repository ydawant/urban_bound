require 'spec_helper'

describe User do
	it { should be_instance_of(User) } 
	it { should have_many(:books) }

	it { should validate_presence_of(:first_name) }
  	it { should validate_presence_of(:last_name) }
  	it { should validate_presence_of(:email) }
end