class User < ActiveRecord::Base
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :profilepics
  has_secure_password
  validates :name,  presence: true, length: { maximum: 50 }

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider         = auth.provider
      user.uid              = auth.uid
      user.oauth_token      = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.name             =  auth.info.name
      user.save
    end
  end
end