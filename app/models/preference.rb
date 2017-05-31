class Preference < ActiveRecord::Base
  validates :company, presence: true
  validates :email_from, presence: true

  def self.default
    where(default: true).first || create(default: true)
  end
end
