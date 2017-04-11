class AdminController < ApplicationController

  def index
    @users = User.all.includes(:roles)
    @surveys = Survey.all.includes(:comments, :answers)
    @preference = Preference.default
  end
end
