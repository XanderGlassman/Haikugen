class Like < ActiveRecord::Base
  belongs_to :likeable, polymorphic: true
  belongs_to :user

  # validates :user_id, :likeable_id, :likeable_type, presence: :true
   validates_uniqueness_of :user_id, :scope => [:likeable_type, :likeable_id ]
end
