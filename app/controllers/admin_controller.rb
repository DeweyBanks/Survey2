class AdminController < ApplicationController
  before_action :authenticate_admin

  def index
    @users = User.all.includes(:role).paginate(:page => params[:page], :per_page => 10)
    @surveys = Survey.all.includes(:comments, :answers).paginate(:page => params[:page], :per_page => 10)
    @preference = Preference.default
  end

  private

  def authenticate_admin
     redirect_to root_path, :flash => { :notice => "Insufficient rights!" } unless
     current_user && current_user.role.name == "Admin"
  end

end
