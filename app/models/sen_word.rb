class SenWord < ActiveRecord::Base
  belongs_to :word
  belongs_to :sentence
end
