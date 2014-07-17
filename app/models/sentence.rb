class Sentence < ActiveRecord::Base
  belongs_to :book
  has_many :sen_words
  has_many :words, through: :sen_words

  before_save :set_end_word


  def set_end_word
    self.end_word = self.body.split(" ").last
  end

end
