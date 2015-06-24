require 'rails_helper'

RSpec.feature "User can find pairs", type: :feature do
  scenario "user can find pairs button on root page" do
    fake_user = User.create(name: 'random user', description: 'I need u')
    language = fake_user.languages.create(name: "clojure")
    github_login
    visit root_path
    click_link_or_button("Login")

    visit root_path
    click_link_or_button("Find Pairs")

    expect(page).to have_text(fake_user.name)
    expect(page).to have_text(fake_user.description)
    expect(page).to have_text(language.name)
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
