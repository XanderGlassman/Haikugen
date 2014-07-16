class User < ActiveRecord::Base
  has_many :favorites, class_name: "Like"
  has_many :likes, as: :likeable
  has_many :books
  has_many :poems


  has_secure_password
end
