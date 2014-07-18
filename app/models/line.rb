class Line < ActiveRecord::Base
  belongs_to :poem
  validates :body, :poem_id, presence: :true

  def syllable_count
    (self.body.split(" ").map{|word| Word.find_or_create_by(body: word).syllable_count}.inject(:+)) if self.body != ""
  end
end
