class WelcomeController < ApplicationController

  def index

  end

  def account
    @user = User.find(params[:id])
    @surveys = @user.surveys.paginate(:page => params[:page], :per_page => 10)
  end

  def about
    @feedback = Feedback.new
  end

end
