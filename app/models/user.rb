class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name
  require 'oauth2'


	def self.facebook_client
	  OAuth2::Client.new(ENV["FACEBOOK_APP_ID"],
	                     ENV["FACEBOOK_SECRET"],
	                     authorize_url: '/dialog/oauth',
	                     token_url: 'oauth/access_token',
	                     site: 'https://graph.facebook.com')
  end

  def self.token(fb_token)
    OAuth2::AccessToken.from_hash(User.facebook_client,
                                  { :access_token => fb_token,
                                    :mode => :query,
                                    :param_name => "oauth_token" })
  end

  def self.find_or_create_user_by_token(params)
    response = JSON.parse(self.token(params['accessToken']).get('/me').body)
    user = where(provider: params['provider'], uid: params['userID']).first_or_create
    user.provider = params['provider']
    user.uid = params['userID']
    user.email = response['email']
    user.first_name = response['first_name']
    user.last_name = response['last_name']
    user.oauth_token = params['accessToken']
    user.oauth_expires_at = Time.at(params['expiresIn'].to_i.seconds.from_now)
    user.save!
    user
  end
end
