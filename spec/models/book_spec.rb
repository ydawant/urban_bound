require 'spec_helper'

describe Book do
	it { should be_instance_of(Book) }
	it { should have_many(:users)}
end