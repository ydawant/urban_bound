require 'spec_helper'

describe AllBook do

  it { should be_instance_of(AllBook) }
  it { should belong_to(:user) }
  it { should belong_to(:book) }

end