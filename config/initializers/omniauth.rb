Rails.application.config.middleware.use OmniAuth::Builder do
 # provider :open_id, :store => OpenID::Store::Filesystem.new('/tmp'), :name => 'google', :identifier => 'https://www.google.com/accounts/o8/id', :require => 'omniauth-openid'
 provider :google_oauth2, '625034042737.apps.googleusercontent.com', 'DqEo4eG3MhEiLCVf3T6pXTqh', {access_type: 'online', approval_prompt: ''}
end