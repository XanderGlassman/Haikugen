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

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }

  it { should have_many(:favorites) } # class_name: "Like"
  it { should have_many(:likes) } # as :likeable
  it { should have_many(:books) }
  it { should have_many(:poems) }

  describe "when password is not present" do
    before do
      @user = User.new(first_name: "Example User", last_name: "Example lastname", email: "user@example.com", password: "")
    end
    it { should_not be_valid }
  end
end
