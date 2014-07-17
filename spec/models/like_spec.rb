require 'spec_helper'

describe Like do
  before do
    @poem = Poem.new(poem_type: "Sestina", title: "The Sunny Day", body: "SDKLJFkdjfksdjf wow so pretty", user_id: User.create.id)
    @like = Like.new(user_id: 1, likeable_type: "Poem", likeable_id: @poem.id)
  end

  it "should return the liked object" do
    expect(@like.likeable_id).to eq @poem.id
  end

  subject { @like }

  it { should respond_to(:user_id) }
  it { should respond_to(:likeable_type) }
  it { should respond_to(:likeable_id) }

  it { should belong_to(:user) }
  it { should belong_to(:likeable) }

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:likeable_id) }
  it { should validate_presence_of(:likeable_type) }

end
