require 'spec_helper'

describe Poem do
  before do
    @poem = Poem.new(poem_type: "Sestina", title: "The Sunny Day", body: "SDKLJFkdjfksdjf wow so pretty", user_id: User.create.id)
  end

  subject { @poem }

  it { should respond_to(:poem_type) }
  it { should respond_to(:title) }
  it { should respond_to(:body) }
  it { should respond_to(:user_id) }

  it { should be_valid }
end
