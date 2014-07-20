class Line < ActiveRecord::Base
  belongs_to :poem
  validates :body, :poem_id, presence: :true

  before_save :downcase

  def syllable_count
    (self.body.split(" ").map{|word| Word.find_or_create_by(body: word).syllable_count}.inject(:+)) if self.body != ""
  end

  def downcase
    self.body.downcase!
  end
end
