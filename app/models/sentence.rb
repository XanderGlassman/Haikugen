class Sentence < ActiveRecord::Base
  belongs_to :book
  has_many :sen_words
  has_many :words, through: :sen_words

end
