require 'spec_helper'

describe 'WelcomeController' do
  it 'loads' do
    expect(response.status).to eq 200
  end
end
