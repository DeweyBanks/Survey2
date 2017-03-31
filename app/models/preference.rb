class Preference < ActiveRecord::Base

  validates :company, presence: true
  validates :email_from, presence: true

  def self.default
    where(default: true).first || new(default: true)
  end

end
