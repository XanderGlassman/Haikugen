require 'spec_helper'

describe SenWord do
  describe SenWord do
  	it { should respond_to(:word) }
    it { should respond_to(:sentence) }
    it { should belong_to(:word) }
    it { should belong_to(:sentence) }
  end
end

