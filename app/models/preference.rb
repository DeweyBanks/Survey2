class Preference < ActiveRecord::Base

  def self.default
    where(default: true).first || create(default: true)
  end
end
