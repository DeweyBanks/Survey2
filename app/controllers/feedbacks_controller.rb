# Handles Feedback form
class FeedbacksController < ApplicationController

  def create
    @feedback = Feedback.new(feedback_params)
    respond_to do |format|
      if @feedback.save
        FeedbackMailer.feedback_email(@feedback).deliver_now
        format.html { redirect_to(about_path, notice: 'Your feedback is appreciated!.') }
      else
        format.html { redirect_to(about_path, notice: 'Something went wrong.') }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(
      :body,
      :email
    )
  end
end
