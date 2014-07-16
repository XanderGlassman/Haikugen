require 'spec_helper'

describe Book do
  before do
    @user = User.new(first_name: "Example User", last_name: "Example lastname", email: "user@example.com",
                     password: "foobar")
    @book = Book.new(user_id: @user.id, title: "RSpec for dummies", author: "Celeen Rusk")
  end

  it "should return the user ID for author" do
    expect(@book.user_id).to eq @user.id
  end

  subject { @book }

  it { should respond_to(:user_id) }
  it { should respond_to(:title) }
  it { should respond_to(:author) }


  it { should be_valid }


end
