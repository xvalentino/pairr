require 'rails_helper'

RSpec.feature "Matching", type: :feature do
  include LoginHelper

  scenario "works" do
    github_login
    visit root_path
    click_link_or_button("Login")
    click_link_or_button("Complete Profile")
    user1 = User.find_by(name: "Paul Grever")
    user2 = User.create!(name: "Horace Rules")

    Pair.create(user_id: user1.id, potential_match_id: user2.id, status: 2, count: 2)
    visit root_path

    expect(page).to have_text("Horace Rules")
  end
end
