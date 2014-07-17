require 'spec_helper'

describe Word do
  before do
    @word = Word.new(body: "hi", syllable_count: 1)
  end

  subject { @word }

  it { should respond_to(:body) }
  it { should respond_to(:syllable_count) }
  it { should be_valid }
end
