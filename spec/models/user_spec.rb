require 'spec_helper'

describe User do

  before do
    @user = User.new(first_name: "Example User", last_name: "Example lastname", email: "user@example.com",
                     password: "foobar")
  end

  subject { @user }

  it { should respond_to(:last_name) }
  it { should respond_to(:first_name) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_digest) }

  it { should be_valid }



  describe "when password is not present" do
    before do
      @user = User.new(first_name: "Example User", last_name: "Example lastname", email: "user@example.com", password: "")
    end
    it { should_not be_valid }
  end
end
