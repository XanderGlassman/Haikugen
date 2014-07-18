class PoemsController < ApplicationController
  def new
    @user = User.find(session[:user_id])
  end

  # def show
  #   @user = User.find(params[:id])
  # end
  def haiku
    @match_sens = []
    Sentence.where(book_id: params[:book_id]).each do |sen|
      if sen.body.downcase.match(params[:haiku_key].downcase) != nil
        @match_sens << sen
      end
    end
    @poem = Poem.create(poem_type: "Haiku", title: params[:haiku_key], user_id: session[:user_id])
    unless @match_sens.empty?
      haiku_array = []
      2.times do
        line = Line.create(body: "")
#        line_1_syllable_count = 0
        until line.syllable_count == 5
 #         line_1_syllable_count
          Word.find_or_create_by(body: sample_word)
          line.body = line.body + " " + sample_word
#          line_1_syllable_count += rand_word.syllable_count
          if line.syllable_count > 5
            line.body = line.body[/(.*)\s/,1]
          #  line_1_syllable_count -= rand_word.syllable_count
          end
        end
        @poem.lines << line
        #haiku_array << line_1.map{|obj| obj.body}.join(" ")
      end
    else
      p params[:haiku_key] + " doesn't exist in the book"
    end
    # line_2 = [Word.find_or_create_by(body: params[:haiku_key])]
    # line_2_syllable_count = line_2[0].syllable_count
    # until line_2_syllable_count == 7
    #   line_2_syllable_count
    #   rand_word = Word.find_or_create_by(body: sample_word)
    #   line_2 << rand_word
    #   line_2_syllable_count += rand_word.syllable_count
    #   if line_2_syllable_count > 7
    #     line_2.pop
    #     line_2_syllable_count -= rand_word.syllable_count
    #   end
    # end
    # haiku_array.insert(1, line_2.map{|obj| obj.body}.shuffle.join(" "))
    # p "haiku array: " + haiku_array.inspect
    # create_poem(haiku_array)
    # # redirect_to "poems/#{@poem.id}"
    # # create_poem
  end

  def create_poem(haiku_array)
    @poem = Poem.create(title: params[:haiku_key], body: haiku_array.join(" "), poem_type: "Haiku", user_id: session[:user_id])
  end

private
  # def haiku_params
  #   params.require(:book).permit(:book_id)
  # end
  def sample_word
    @match_sens.sample.body.split(" ").sample.gsub(/[^a-z]/i, '')
  end

end
