require 'rails_helper'

RSpec.feature "Login", type: :feature do
  include LoginHelper

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
