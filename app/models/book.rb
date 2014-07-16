class Book < ActiveRecord::Base
  has_many :sentences
  belongs_to :user

  # after_save :create_sens

  # def create_sens
  #   book = []
  #   File.open(self.path).each_line { |line| book << line }
  #   book_string = book.join("")
  #   book_string.gsub!(/\s+/, " ")

  #   book_string.split(/[.?!]\s/).each do |e|
  #     Sentence.create(sen: e, endword: e.split(" ").last, book_id: self.id)
  #   end
  # end
end
