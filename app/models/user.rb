class User < ActiveRecord::Base
  has_many :favorites, class_name: "Like"
  has_many :likes, as: :likeable
  has_many :books
  has_many :poems

  validates :first_name, :last_name, :email, presence: :true

  #as_secure_password

 include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end


end
