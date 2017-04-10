class Gatekeeper


  def self.application_authenticated?(token)
    ApiKey.find_by(access_token: token).present?
  end

  def self.user_authenticated?(token)
    User.find_for_token_authentication(token)
  end
end
