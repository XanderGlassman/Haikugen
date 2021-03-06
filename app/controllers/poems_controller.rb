class PoemsController < ApplicationController
  def new
    @user = User.find(session[:user_id])
  end

  # def show
  #   @user = User.find(params[:id])
  # end

  def index
    @poem= Poem.all
  end

  def haiku
    create_match_sens
    @poem = Poem.create(poem_type: "Haiku", title: params[:haiku_key], user_id: session[:user_id])
    unless @match_sens.empty?
      2.times do |i|
        @line = Line.create(body: "")
        create_line(5)
        create_middle_line if i == 0
      end
    else
      redirect_to "/poems/new"
    end
  end

  def vote
    Like.create(user_id: session[:user_id], likeable_id: params[:id], likeable_type: "Poem")
    Poem.find(params[:id]).likes.count
  end

private
  def create_match_sens
      @match_sens = []
        Sentence.where(book_id: params[:book_id]).each do |sen|
      if sen.body.downcase.match(params[:haiku_key].downcase) != nil
        @match_sens << sen
      end
    end
  end

  def create_line(desired_syllable_count)
    @dsc = desired_syllable_count
    until @line.syllable_count == desired_syllable_count
      shuffle
      sample_word
      Word.find_or_create_by(body: @sample)
      @line.body = @line.body + " " + @sample
      too_many_syllables?(@dsc)
    end
    exclude_double_words
    @poem.lines << @line
  end

  def exclude_double_words
    if @line.body.split(" ").uniq.length !=  @line.body.split(" ").length
      @line.body = ""
      create_line(@dsc)
    end
  end

  def create_middle_line
    @line = Line.create(body: params[:haiku_key])
    create_line(7)
  end

  def shuffle
    @line.body = @line.body.split(" ").shuffle.join(" ")
  end

  def too_many_syllables?(desired_syllable_count)
      if @line.syllable_count > desired_syllable_count
        @line.body = @line.body[/(.*)\s/,1]
      end
  end

  def sample_word
    @sample = @match_sens.sample.body.split(" ").sample.gsub(/[^a-z -'']/i, '')
    exclude_double_words
  end

end
