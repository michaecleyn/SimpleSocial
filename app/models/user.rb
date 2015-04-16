class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :omniauthable, :omniauth_providers => [:twitter]
	has_many :posts
  has_many :urls

  # def self.url_not_nil
  #   where self.urls != nil
  # end

 def self.from_omniauth(auth)
    Rails.logger.info 'yooooo'
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
	end

  def self.find_by_twitter(auth)
    #User.from_omniauth(request.env["omniauth.auth"]) ||
    user = User.find_by(provider: auth['provider'], uid: auth['uid']) ||
            User.create!(
                provider: auth['provider'],
                uid: auth['uid'],
                name: auth['info']['name']
              )
      user.update(
      token: auth['credentials']['token'],
      secret: auth['credentials']['secret']
      )
      user
    # @user = User.from_omniauth(request.env["omniauth.auth"])

    # if @user.nil?
    #   @user = User.create(
    #     provider: auth['provider'],
    #     uid: auth['uid'],
    #     name: auth['info']['name']
    #   )

  end
end
