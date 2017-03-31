require 'rails_helper'

RSpec.describe Answer, type: :model do
  context "Associations" do
    it { is_expected.to belong_to :survey }
  end
end
