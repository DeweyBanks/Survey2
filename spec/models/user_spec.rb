require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    before { FactoryGirl.build(:user) }
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of(:password) }
  end
  context "associations" do
    it { is_expected.to belong_to :role }
    it { should have_many(:surveys).dependent(:destroy) }
  end
  context "admin scope" do
    user = FactoryGirl.create(:user, email: ENV["ADMIN_EMAIL"])
    it "has the role of admin" do
      expect(user.is_admin?).to be(true)
    end
  end
end
