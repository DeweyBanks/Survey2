class UsersController < ApplicationController

  def edit
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    @user.comments.destroy_all
    @user.surveys.destroy_all
    @user.save
    respond_to do |format|
      format.js { render :layout => "application" }
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :username,
      :email,
      :comments,
      :surveys,
      :blocked_at
      )
  end
end
