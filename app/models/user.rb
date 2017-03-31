class User < ActiveRecord::Base

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :username,
    :presence => true,
    :uniqueness => {
      :case_sensitive => false,
      :message => "has already been taken"
    }
  validates_format_of :username, with: /^[a-zA-Z0-9]+([a-zA-Z0-9](_|-| )[a-zA-Z0-9])*[a-zA-Z0-9]+$/, :multiline => true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.username = auth.info.name   # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  rails_admin do
    object_label_method :username
  end

  def is_admin?
    role = Role.find_or_create_by(name: "Admin")
    self.role_id == role.id
  end


end
