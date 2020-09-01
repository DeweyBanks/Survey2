# Handles Settings for the App
class PreferencesController < ApplicationController

  def update
    @preference = Preference.find(params[:id])
    respond_to do |format|
      if @preference.update(preference_params)
        format.html { redirect_to admin_path, notice: 'Settings were successfully updated.' }
        format.json { render :show, status: :ok, location: @preference }
      else
        format.html { redirect_to admin_path }
        format.json { render json: @preference.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def preference_params
    params.require(:preference).permit(
      :company,
      :email_from,
      :default
    )
  end
end
