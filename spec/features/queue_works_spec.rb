require 'rails_helper'

RSpec.feature "Login", type: :feature do
  it "works" do
    create_random_users
    github_login
    visit root_path
    click_link_or_button("Login")
    user = User.create(name: "I AM TEST", description: "HELLO")
    pair = Pair.create(user_id: user.id, potential_match_id: User.find_by(name: "Paul Grever").id)
    pair.up
    click_link_or_button("Complete Profile")
    click_link_or_button("Find Pairs")

    expect(page).to have_text("I AM TEST")
  end
end

def create_random_users
  5.times do |i|
    User.create!(name: i, description: i, image: "#{i}.jpg")
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
