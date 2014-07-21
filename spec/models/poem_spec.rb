require 'spec_helper'

describe Poem do
  before do
    @poem = Poem.new(poem_type: "Sestina", title: "The Sunny Day", body: "SDKLJFkdjfksdjf wow so pretty", user_id: 1)
  end

  subject { @poem }

  it { should respond_to(:poem_type) }
  it { should respond_to(:title) }
  it { should respond_to(:body) }
  it { should respond_to(:user_id) }

  it { should validate_presence_of(:poem_type) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:user_id) }

  it { should belong_to(:user) }
  it { should have_many(:likes) }
end
