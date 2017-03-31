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
   login_user
    it "assigns the requested survey to @survey" do
      @survey = FactoryGirl.create(:survey_with_answers, answers_count: 5)
      get :show, id: @survey
      expect(assigns(:survey)).to eq(@survey)
    end
    it "renders the :results template" do
      @survey = FactoryGirl.create(:survey_with_answers)
      get :results, id: @survey
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
        expect {
          post :create, survey: { title: "Test Survey", user_id: user.id,
                                answers_attributes: [{body: "Answer to Test Survey"}]
                              }
          }.to change(Survey, :count)
      end

      it "redirects to the new survey" do
        survey = FactoryGirl.attributes_for(:survey)
        post :create, survey: survey
        expect(response).to redirect_to(survey_path(assigns[:survey]))
      end

    end

    context "with invalid attributes" do
      it "does not save the new contact in the database" do
        expect{
          post :create, survey: FactoryGirl.attributes_for(:invalid_survey)
        }.to_not change(Survey,:count)
      end
      it "re-renders the :new template" do
        post :create, survey: FactoryGirl.attributes_for(:invalid_survey)
        expect(response).to render_template :new
      end
    end
  end

  describe "POST #tab_results " do
    it "increases votes total" do
      survey = FactoryGirl.create(:survey_with_answers)
      answer = survey.answers.first
      votes = answer.votes
      post :tab_results, :answer_id => answer.id, :id => survey.id
      responese_answer = assigns :answer
      expect(responese_answer.votes).to be > votes
    end
  end


end
