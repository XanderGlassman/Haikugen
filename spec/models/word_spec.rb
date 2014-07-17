require 'spec_helper'

describe Word do
  before do
    @word = Word.new(body: "hi", syllable_count: 1)
    @word2 = Word.create(body: "Abagail", syllable_count: nil)
    @word3 = Word.create(body: "Teletubby", syllable_count: nil)
  end

  subject { @word }

  it { should respond_to(:body) }
  it { should respond_to(:syllable_count) }
  it { should be_valid }

  it { should validate_presence_of(:body) }

  it { should have_many(:sen_words) }
  it { should have_many(:sentences) } # through: :sen_words

  describe "#new_count" do
    it "should fill in number of syllables for words not already in words table" do
      expect(@word2.syllable_count).to eq(3)
    end

    it "should fill in number of syllables for words not already in words table" do
      expect(@word3.syllable_count).to eq(4)
    end
  end
end
