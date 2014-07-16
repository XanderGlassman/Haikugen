class Word < ActiveRecord::Base
  has_many :sen_words
  has_many :sentences, through: :sen_words
end
