require 'rails_helper'

RSpec.describe Feedback, type: :model do
  context "Validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:body) }
  end

end
