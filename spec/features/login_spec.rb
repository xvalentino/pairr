require 'rails_helper'

RSpec.feature "Login", type: :feature do
  it "works" do
    github_login

    visit root_path
    click_link_or_button("Login")

    save_and_open_page
    expect(page).to have_text("Paul")
  end
end

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
