class Word < ActiveRecord::Base
  has_many :sen_words
  has_many :sentences, through: :sen_words

  validates :body, presence: :true

  before_create :new_count

  private
  def new_count
    if self.syllable_count == nil
      word = self.body
      word.downcase!
      return self.syllable_count = 1 if word.length <= 3
      word.sub!(/(?:[^laeiouy]es|ed|[^laeiouy]e)$/, '')
      word.sub!(/^y/, '')
      self.syllable_count = word.scan(/[aeiouy]{1,2}/).size
      self.save
    end
  end

end
