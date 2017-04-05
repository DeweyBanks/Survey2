require "rails_helper"

RSpec.describe WelcomeController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/").to route_to("welcome#index")
    end

    it "routes to #account" do
      expect(:get => "/account/1").to route_to("welcome#account")
    end

  end
end
