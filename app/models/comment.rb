class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :survey

  validates :user, :presence => true
end
