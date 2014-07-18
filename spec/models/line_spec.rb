require 'spec_helper'

describe Line do
    let (:cheesecake) { Word.create(body: "cheesecake", syllable_count: 2) }
    let (:has) { Word.create(body: "has", syllable_count: 1) }
    let (:good) { Word.create(body: "good", syllable_count: 1) }
    let (:value) { Word.create(body: "value", syllable_count: 2) }

    let (:line_1) { Line.create(body: "cheesecake has good value", poem_id: 1) }
  describe "#syllable_count" do
    it "should count the number of syllables in a word" do
      expect(line_1.syllable_count).to eq(6)
    end
  end

  before do
    @line_1 = Line.new(body: "cheesecake has good value", poem_id: 1)
  end
  subject { @line_1 }

  it { should respond_to(:body) }
  it { should respond_to(:poem_id) }

  it { should validate_presence_of(:poem_id) }
  it { should validate_presence_of(:body) }

  it { should belong_to(:poem) }

end
