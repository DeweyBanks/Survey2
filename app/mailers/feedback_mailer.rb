require 'sendgrid-ruby'
include SendGrid
require 'json'

class FeedbackMailer < ApplicationMailer


  def feedback_email(feedback)
    @feedback = feedback
    from = Email.new(email: 'admin@surveymaker.com')
    subject = "You have feedback from #{@feedback.email}"
    to = Email.new(email: ENV['ADMIN_EMAIL'])
    content = Content.new(type: 'text/plain', value: @feedback.body)
    mail = Mail.new(from, subject, to, content)
    # puts JSON.pretty_generate(mail.to_json)
    puts mail.to_json
    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'], host: 'https://api.sendgrid.com')
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.headers
  end
end
