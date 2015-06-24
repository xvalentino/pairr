require 'rails_helper'

RSpec.feature "Login", type: :feature do
  include LoginHelper

  it "works" do
    github_login

    visit root_path
    click_link_or_button("Login")

    save_and_open_page
    expect(page).to have_text("Paul")
  end
end
