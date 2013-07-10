require 'spec_helper'

describe User do

 it { should be_instance_of(User) }

  it { should ensure_length_of(:first_name).is_at_least(2).
              with_message(/must have at least 2 letters/) }
  it { should ensure_length_of(:last_name).is_at_least(2).
              with_message(/must have at least 2 letters/) }

  it { should allow_value("abc@def.com").for(:email) }
  it { should_not allow_value("bad_email.com", "ab@cd.com").for(:email) }
  it "validates uniqueness of email" do
    user = User.new(:first_name => 'A', :last_name => 'B', :email => 'C')
    user.password_digest = 'D'
    user.save!(:validate => false)

    should validate_uniqueness_of(:email).case_insensitive
  end

  it { should validate_confirmation_of(:password) }
  it { should allow_value("Password1", "passW0rd").for(:password) }
  it { should_not allow_value("password", "Password", "passw0rd").for(:password) }
  it { should ensure_length_of(:password).is_at_least(6).
              with_message(/must have at least 6 characters/) }

end