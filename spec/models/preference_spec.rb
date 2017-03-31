require 'rails_helper'

RSpec.describe Preference, type: :model do
  context "Validations" do
    it { should validate_presence_of(:company) }
    it { should validate_presence_of(:email_from) }
  end

  describe ".default" do
    preference = Preference.default
    it "should be default instance" do
      expect(preference.default).to be(true)
    end
  end
end

