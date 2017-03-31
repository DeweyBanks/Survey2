require 'rails_helper'

RSpec.describe Role, type: :model do
  context "validations" do
    it { should validate_uniqueness_of(:name) }
  end
  context "Associations" do
    it { should have_many(:users) }
  end
end
