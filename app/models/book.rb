class Book < ActiveRecord::Base
  has_many :sentences
  belongs_to :user
end
