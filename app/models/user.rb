class User < ActiveRecord::Base
  has_many :favorites, class_name: "Like"
  has_many :likes, as: :likeable
  has_many :books
  has_many :poems

  validates :first_name, :last_name, :email, presence: :true

  has_secure_password



end
