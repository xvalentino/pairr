module LoginHelper
  def github_login
    OmniAuth.config.test_mode = true
    OmniAuth.config.logger = Rails.logger
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({ 
      provider: "github",
      uid: "123545",
      info: {
        name: "Paul Grever",
        image: "https://avatars.githubusercontent.com/u/3664281?v=3"
      },
      credentials: {
        token: "mock_token",
        secret: "mock_secret"
      }
    })
  end
end
