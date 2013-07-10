require 'spec_helper'

describe Book do
	it { should be_instance_of(Book) }
	it { should have_many(:users)}

	it { should validate_presence_of(:title) }
  	it { should validate_presence_of(:author) }
end