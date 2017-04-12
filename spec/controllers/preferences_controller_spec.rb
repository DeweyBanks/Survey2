require 'rails_helper'

RSpec.describe PreferencesController, type: :controller do

   describe "PUT update/:id" do
    let(:attr) do
      { :company => 'RSPEC TEST' }
    end
    before(:each) do
      @preference = FactoryGirl.create(:preference)
      put :update, :id => @preference.id, :preference => attr
      @preference.reload
    end

    it { expect(response).to redirect_to(admin_path) }
    it { expect(@preference.company).to eql attr[:company] }
   end

end
