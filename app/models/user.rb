class User < ActiveRecord::Base
  has_many :surveys, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  belongs_to :role
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :username, :presence => true
  after_create :set_role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.username = auth.info.name
    end
  end

  def is_admin?
    role = Role.find_or_create_by(name: "Admin")
    self.role_id == role.id
  end

  def account_active?
    blocked_at.nil?
  end

  def active_for_authentication?
    super && account_active?
  end

  def inactive_message
     "User account has been blocked"
  end

  private

  def set_role
    if self.email == ENV['ADMIN_EMAIL']
      role = Role.find_or_create_by(name: "Admin")
      self.role_id = role.id
    else
      role = Role.find_or_create_by(name: "User")
      self.role_id = role.id
    end
    self.save
  end
end
