require 'rails_helper'

RSpec.describe Survey, type: :model do

  context "associations" do
    it { is_expected.to belong_to :user }
    it { should have_many(:answers).dependent(:destroy) }
    it { should accept_nested_attributes_for(:answers) }
  end

end
