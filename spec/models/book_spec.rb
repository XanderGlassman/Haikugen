require 'spec_helper'

describe Book do
  before do
    @user = User.new(first_name: "Example User", last_name: "Example lastname", email: "user@example.com",
                     password: "foobar")
    @book = Book.create(user_id: @user.id, title: "RSpec for dummies", author: "Celeen Rusk", path: "public/text/Test.txt")
  end

  it "should return the user ID for author" do
    expect(@book.user_id).to eq @user.id
  end

  subject { @book }

  it { should respond_to(:user_id) }
  it { should respond_to(:title) }
  it { should respond_to(:author) }


  it { should be_valid }

  describe "#creat_sens" do
    it "should create sentences from text in the book" do
      expect(Sentence.find_by_book_id(@book.id).body).to eq("There once was a happy text file")
    end
  end
end
