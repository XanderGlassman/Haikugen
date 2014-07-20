class UploadController < ApplicationController
  # def create
  #   # content_type :text
  #   p params[@original_filename]
  #   p "kljshdflkjshdflkjhsdlfkjhsdf"
  #   path = "public/text/" + params[:headers][:filename]
  #   File.open(path, "wb") do |f|
  #     f.write(params[:text][:tempfile].read)
  #     puts(params[:text])
  #   end
  #   Book.create(title: params[:title], path: path)
  #   redirect "/"
  # end

  def create
    uploaded_file = params[:file]
    @path = "public/text/" + params[:title] + '.txt'
    # p params[:file].original_filename
    file_content = uploaded_file.read
    p uploaded_file.open

    File.open(@path, "wb") do |f|
      f.write(uploaded_file.read)
      # p f.path
    end
    create_book
  end

  private
  def create_book
    Book.create(user_id: session[:user_id], title: params[:title], author: params[:author], path: @path)
  end
end

