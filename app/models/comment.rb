class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :survey
  has_many :votes

  validates :user, :presence => true
  validates :survey, :presence => true

end
