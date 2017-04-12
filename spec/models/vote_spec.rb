require 'rails_helper'

RSpec.describe Vote, type: :model do
  context "Associations" do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :comment }
  end
end
