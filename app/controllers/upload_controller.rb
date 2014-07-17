class UploadController < ApplicationController
  def create
      content_type :text
  path = "public/text/" + params[:text][:filename]
  File.open(path, "wb") do |f|
    f.write(params[:text][:tempfile].read)
    puts(params[:text])
  end
  Book.create(title: params[:title], path: path)
  redirect "/"
  end

  private
  def book_params
    params.require(:book).permit(:title, :path)
  end
end
