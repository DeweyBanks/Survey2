require "rails_helper"

RSpec.describe FeedbackMailer, type: :mailer do
  describe "feedback_email" do
    feedback = FactoryGirl.create(:feedback, :body => "TEST")
    let(:mail) { FeedbackMailer.feedback_email(feedback) }

    it "renders the headers" do
      expect(mail.subject).to eq("Feedback from SurveyMaker")
      expect(mail.to).to eq([ENV['ADMIN_EMAIL']])
      expect(mail.from).to eq(["admin@surveymaker.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("TEST")
    end
  end
end
