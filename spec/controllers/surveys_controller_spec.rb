require 'rails_helper'

RSpec.describe SurveysController, type: :controller do

  describe "Get index" do
    it "assigns @surveys" do
      @surveys = Survey.all
      get :index
      expect(assigns(:surveys).to_a).to eq(@surveys.to_a)
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "assigns the requested survey to @survey" do
      user = FactoryGirl.create(:user)
      @survey = FactoryGirl.create(:survey_with_answers, :user_id => user.id, answers_count: 5)
      get :show, params: { id: @survey }
      expect(assigns(:survey)).to eq(@survey)
    end
    it "renders the :results template" do
      user = FactoryGirl.create(:user)
      @survey = FactoryGirl.create(:survey_with_answers, :user_id => user.id)
      get :results, params: { id: @survey }
      expect(response).to render_template(:results)
    end
  end

  describe "GET #new" do
    it "assigns a new Survey to @survey" do
      get :new
      expect(assigns(:survey)).to be_a_new(Survey)
    end
    it "renders the :new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new survey in the database" do
        user = FactoryGirl.create(:user)
        sign_in(user)
        params = {
          survey: {
            title: 'Title',
            user_id: user.id,
            answers_attributes: [
              { body: 'Answer 1' },
              { body: 'Answer 2' }
            ]
          }
        }
        expect {
          post :create, params: params
          }.to change{ Survey.count }.by(1)
      end

      it "redirects to the new survey" do
        user = FactoryGirl.create(:user)
        sign_in(user)
        params = {
          survey: {
            title: 'Title',
            user_id: user.id,
            answers_attributes: [
              { body: 'Answer 1' },
              { body: 'Answer 2' }
            ]
          }
        }
        post :create, params: params
        created_survey = assigns[:survey]
        target_url = "http://test.host/tab_results?id=#{created_survey.id}&notice=Survey+was+successfully+created."
        expect(response).to redirect_to(target_url)
      end

    end

    context "with invalid attributes" do
      it "does not save the new survey in the database" do
        expect{
          post :create, params: { survey: FactoryGirl.attributes_for(:survey) }
        }.to_not change(Survey,:count)
      end
      it "re-renders the :new template" do
        user = FactoryGirl.create(:user)
        sign_in(user)
        post :create, params: { survey: FactoryGirl.attributes_for(:survey) }
        expect(response).to render_template :new
      end
    end
  end

  describe "POST #tab_results " do
    it "increases votes total" do
      user = FactoryGirl.create(:user)
      survey = FactoryGirl.create(:survey_with_answers, :user_id => user.id)
      answer = survey.answers.first
      votes = answer.votes
      post :tab_results, params: { :answer_id => answer.id, :id => survey.id }
      responese_answer = assigns :answer
      expect(responese_answer.votes).to be > votes
    end
  end


end
