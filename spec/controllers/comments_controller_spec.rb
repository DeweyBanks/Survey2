require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  describe "POST #create" do
    context "with valid params" do
      before :each do
        @user = FactoryGirl.create(:user)
        sign_in @user
        @survey = FactoryGirl.create(:survey_with_answers, :user_id => @user.id)
      end

       it "creates a new Comment" do
        expect {
          post :create, comment: attributes_for(:comment, :user_id => @user.id), survey_id: @survey
        }.to change(Comment, :count).by(1)
      end

      it "assigns a newly created comment as @comment" do
        post :create, comment: attributes_for(:comment, :user_id => @user.id), survey_id: @survey
        expect(assigns(:comment)).to be_a(Comment)
        expect(assigns(:comment)).to be_persisted
      end

      it "redirects to the created comment" do
        post :create, comment: attributes_for(:comment, :user_id => @user.id), survey_id: @survey
        expect(response).to redirect_to(results_path(id: @survey.id))
      end
    end
  end

  describe "PUT update/:id" do
    let(:attr) do
      { :body => 'new body' }
    end

    before :each do
      @user = FactoryGirl.create(:user)
      sign_in @user
      @survey = FactoryGirl.create(:survey_with_answers, :user_id => @user.id)
      @comment = FactoryGirl.create(:comment, :user_id => @user.id, :survey_id => @survey.id)
      put :update, :survey_id => @survey.id, :id => @comment.id, :comment => attr
      @comment.reload
    end

    it { expect(response).to redirect_to(results_path(id: @survey.id)) }
    it { expect(@comment.body).to eql attr[:body] }
  end

  describe "DELETE #destroy" do
    before :each do
      @user = FactoryGirl.create(:user)
      sign_in @user
      @survey = FactoryGirl.create(:survey_with_answers, :user_id => @user.id)
      @comment = FactoryGirl.create(:comment, :user_id => @user.id, :survey_id => @survey.id)
    end

    it "destroys the requested comment" do
      expect {
        delete :destroy, :survey_id => @survey.id, :id => @comment.id
      }.to change(Comment, :count).by(-1)
    end

    it "redirects to the survey results" do
      delete :destroy, :survey_id => @survey.id, :id => @comment.id
      expect(response).to redirect_to(results_path(id: @survey.id))
    end
  end

end
