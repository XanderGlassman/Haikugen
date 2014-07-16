require 'spec_helper'

describe Sentence do
  before do
    @sentence = Sentence.new(book_id: Book.create(), body: "The quick brown fox jumps over the lazy dog")
  end

  subject { @sentence }

  it { should respond_to(:book_id) }
  it { should respond_to(:body) }

  it { should be_valid }

  let (:book) { Book.new(user_id: @user.id, title: "RSpec for dummies", author: "Celeen Rusk") }
  describe "#set_end_word" do
    it "should set the end_word field to the last word in the sentence" do
      expect(@sentence.set_end_word).to eq("dog")
    end
  end




end
