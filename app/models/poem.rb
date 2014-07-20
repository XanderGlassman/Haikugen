class Poem < ActiveRecord::Base
  belongs_to :user
  has_many :likes, as: :likeable
  has_many :lines

  validates :poem_type, :title, :user_id, presence: :true


end
