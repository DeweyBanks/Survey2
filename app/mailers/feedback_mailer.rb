require 'sendgrid-ruby'
include SendGrid
require 'json'

class FeedbackMailer < ApplicationMailer
   default :from => 'admin@surveymaker.com'

  def feedback_email(feedback)
    @feedback = feedback
    @url = 'https://survey-constructor.herokuapp.com/admin'
    mail( :to => ENV['ADMIN_EMAIL'],
    :subject => 'Feedback from SurveyMaker' )
  end
end
