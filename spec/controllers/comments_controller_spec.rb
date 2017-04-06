require 'rails_helper'

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

  describe "PUT #update" do
    context "with valid params" do
      before :each do
        @user = FactoryGirl.create(:user)
        sign_in @user
        @survey = FactoryGirl.create(:survey_with_answers, :user_id => @user.id)
      end

      it "updates the requested comment" do
        # comment = Comment.create! valid_attributes
        # put :update, params: {id: comment.to_param, comment: new_attributes}, session: valid_session
        # comment.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested comment as @comment" do
        # comment = Comment.create! valid_attributes
        # put :update, params: {id: comment.to_param, comment: valid_attributes}, session: valid_session
        # expect(assigns(:comment)).to eq(comment)
      end

      it "redirects to the comment" do
        # comment = Comment.create! valid_attributes
        # put :update, params: {id: comment.to_param, comment: valid_attributes}, session: valid_session
        # expect(response).to redirect_to(comment)
      end
    end

    context "with invalid params" do
      it "assigns the comment as @comment" do
        # comment = Comment.create! valid_attributes
        # put :update, params: {id: comment.to_param, comment: invalid_attributes}, session: valid_session
        # expect(assigns(:comment)).to eq(comment)
      end

      it "re-renders the 'edit' template" do
        # comment = Comment.create! valid_attributes
        # put :update, params: {id: comment.to_param, comment: invalid_attributes}, session: valid_session
        # expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested comment" do
      # comment = Comment.create! valid_attributes
      # expect {
      #   delete :destroy, params: {id: comment.to_param}, session: valid_session
      # }.to change(Comment, :count).by(-1)
    end

    it "redirects to the comments list" do
      # comment = Comment.create! valid_attributes
      # delete :destroy, params: {id: comment.to_param}, session: valid_session
      # expect(response).to redirect_to(comments_url)
    end
  end

end
