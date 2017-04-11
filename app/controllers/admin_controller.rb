class AdminController < ApplicationController

  def index
    @users = User.all.includes(:role).paginate(:page => params[:page], :per_page => 10)
    @surveys = Survey.all.includes(:comments, :answers).paginate(:page => params[:page], :per_page => 10)
    @preference = Preference.default
  end
end
