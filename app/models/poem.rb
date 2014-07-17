class Poem < ActiveRecord::Base
  belongs_to :user
  has_many :likes, as: :likeable

  validates :poem_type, :title, :body, :user_id, presence: :true
end
