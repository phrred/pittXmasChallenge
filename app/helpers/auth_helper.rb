module AuthHelper

  # App's client ID. Register the app in Application Registration Portal to get this value.
  CLIENT_ID = '8d678c1b-2ec2-4fc6-b2d6-781f4480f9c0'
  # App's client secret. Register the app in Application Registration Portal to get this value.
  CLIENT_SECRET = 'p2GUvCM2/eAQfK0A[0-ApwasPjXMnHn-'

  # Scopes required by the app
  SCOPES = [ 'openid',
             'profile',
             'User.Read',
             'email' ]

  # Generates the login URL for the app.
  def get_login_url
    client = OAuth2::Client.new(CLIENT_ID,
                                CLIENT_SECRET,
                                :site => 'https://login.microsoftonline.com',
                                :authorize_url => '/common/oauth2/v2.0/authorize',
                                :token_url => '/common/oauth2/v2.0/token')

    login_url = client.auth_code.authorize_url(:redirect_uri => microsoft_auth_url, :scope => SCOPES.join(' '))
  end

  def get_token_from_code(auth_code)
    client = OAuth2::Client.new(CLIENT_ID,
                                CLIENT_SECRET,
                                :site => 'https://login.microsoftonline.com',
                                :authorize_url => '/common/oauth2/v2.0/authorize',
                                :token_url => '/common/oauth2/v2.0/token')

    token = client.auth_code.get_token(auth_code,
                                       :redirect_uri => microsoft_auth_url,
                                       :scope => SCOPES.join(' '))
  end
end
