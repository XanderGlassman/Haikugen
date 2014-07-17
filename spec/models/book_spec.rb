require 'spec_helper'

describe Book do
  before do
    @book = Book.create(user_id: 1, title: "RSpec for dummies", author: "Celeen Rusk", path: "public/text/Test.txt")
  end

  it "should return the user ID for author" do
    expect(@book.user_id).to eq 1
  end

  subject { @book }

  it { should respond_to(:user_id) }
  it { should respond_to(:title) }
  it { should respond_to(:author) }


  it { should validate_uniqueness_of(:title) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:title) }

  it { should belong_to(:user) }
  it { should have_many(:sentences) }


  describe "#create_sens" do
    it "should create sentences from text in the book" do
      expect(Sentence.find_by_book_id(@book.id).body).to eq("There once was a happy text file")
    end
  end
end
