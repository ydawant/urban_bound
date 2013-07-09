require 'spec_helper'

describe AllBooks do

  it { should be_instance_of(AllBooks) }
  it { should belong_to(:user) }
  it { should belong_to(:book) }

end