class PoemsController < ApplicationController
  def new
    @user = User.find(session[:user_id])
  end

  # def show
  #   @user = User.find(params[:id])
  # end
  def haiku
    # Find line 1 of Haiku

    @match_sens = []
    Sentence.where(book_id: params[:book_id]).each do |sen|
      if sen.body.match(params[:haiku_key]) != nil
        @match_sens << sen
      end
    end
    unless @match_sens.empty?
      haiku = []
      2.times do
        line_1 = []
        line_1_syllable_count = 0
        until line_1_syllable_count == 5
          line_1_syllable_count
          rand_word = @match_sens.sample.body.split(" ").sample.gsub(/[^a-z]/i, '')
          p rand_word = Word.find_or_create_by(body: rand_word)
          # p "HERE IS THE RAND WORD's SYLLABLE COUNT:"
          line_1 << rand_word
          line_1_syllable_count += rand_word.syllable_count
          if line_1_syllable_count > 5
            line_1.pop
            line_1_syllable_count -= rand_word.syllable_count
          end
        end
        haiku << line_1.map{|obj| obj.body}.join(" ")
      end
    else
      p params[:haiku_key] + " doesn't exist in the book"
    end
    line_2 = [Word.find_or_create_by(body: params[:haiku_key])]
    line_2_syllable_count = line_2[0].syllable_count
    until line_2_syllable_count == 7
      line_2_syllable_count
      rand_word = @match_sens.sample.body.split(" ").sample.gsub(/[^a-z]/i, '')
      p rand_word = Word.find_or_create_by(body: rand_word)
      # p "HERE IS THE RAND WORD's SYLLABLE COUNT:"
      line_2 << rand_word
      line_2_syllable_count += rand_word.syllable_count
      if line_2_syllable_count > 7
        line_2.pop
        line_2_syllable_count -= rand_word.syllable_count
      end
    end
    haiku.insert(1, line_2.map{|obj| obj.body}.shuffle.join(" "))

    p haiku
  end

private
  # def haiku_params
  #   params.require(:book).permit(:book_id)
  # end
end
