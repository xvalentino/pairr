require 'rails_helper'

RSpec.feature "Login", type: :feature do
  include LoginHelper

  it "works" do
    github_login

    visit root_path
    click_link_or_button("Login")
    expect(page).to_not have_text("Find Pairs")

    User.find_by(name: "Paul Grever").languages << Language.create(name: "doesn't matter")

    fill_in("user[description]", with: "This is the new description")
    click_link_or_button("Complete Profile")
    click_link_or_button("Logout")
    click_link_or_button("Login")

    expect(page).to have_text("Paul")
    expect(page).to have_text("Find Pairs")
  end
end
