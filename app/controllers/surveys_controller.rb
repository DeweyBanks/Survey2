class SurveysController < ApplicationController
  before_action :get_survey, only: [:edit, :show, :tab_results, :results, :destroy]

  def index
    @surveys = Survey.paginate(:page => params[:page], :per_page => 10)
  end

  def create
    @survey = Survey.new(survey_params)

    # In the event an empty answer is passed in, I don't want to throw a validation error.
    # instead I will check for and remove any empty answers.
    @survey.answers.each do |x|
      if x.body.blank?
        x.destroy!
      end
    end

    # for formatting purposes I will add a ? to any title without one.
    unless @survey.title.end_with?("?")
      @survey.title += "?"
    end
    respond_to do |format|
      if @survey.save
        format.html { redirect_to :action => 'results', :id => @survey.id, notice: 'Survey was successfully created.' }
        format.json { render :results, status: :created, location: @survey }
      else
        format.html { render :new }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @survey = Survey.new
  end

  def edit
  end

  def show
  end

  def destroy
    @survey.destroy
      flash[:notice] = "Your survey has been removed"
      redirect_to account_path(current_user)
  end

  def results
    total_votes = []
    @survey.answers.each { |answer| total_votes << answer.votes }
    @total = total_votes.sum
  end

  def tab_results
    @answer = Answer.find(params[:answer_id])
    @answer.votes += 1
    @answer.save!
    redirect_to :action => 'results', :id => @survey.id
  end

  private

  def get_survey
    if params.has_key?(:id)
      @survey = Survey.find(params[:id])
    elsif params.has_key?(:survey_id)
      @survey = Survey.find(params[:survey_id])
    else
      redirect_to root_path
    end
  end

  def survey_params
    params.require(:survey).permit(
      :title,
      :user_id,
      answers_attributes: [:id, :body, :_destroy],
      comments_attributes: [:id, :body, :user_id, :_destroy]
      )
  end

end
