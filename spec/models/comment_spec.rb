require 'rails_helper'

RSpec.describe Comment, type: :model do
  context "Validations" do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:survey) }
  end
  context "Associations" do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :survey }
    it { is_expected.to have_many :votes }
  end

end
