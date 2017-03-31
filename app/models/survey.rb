class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, :allow_destroy => true

  validates :user, :presence => true

end
