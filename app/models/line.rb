class Line < ActiveRecord::Base
  belongs_to :poem
  # validates :body, presence: :true

  before_save :downcase

  def syllable_count
    if self.body == nil || self.body == " "
      0
    else
      (self.body.split(" ").map{|word| Word.find_or_create_by(body: word).syllable_count}.inject(:+))-1
    end
  end

  def downcase
    self.body.downcase!
  end
end
