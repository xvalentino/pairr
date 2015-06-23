require 'rails_helper'

RSpec.feature "Login", type: :feature do
  it "works" do
    github_login
    root_path
    github_login
    visit root_path
    click_link_or_button("Login")
    expect(page).to_have_content "Hello"
  end
end
