require "rails_helper"

RSpec.feature "Create users" do
  scenario "creates a new account with valid credentials" do
    visit new_user_path
    fill_in "Username", with: "justin"
    fill_in "Password", with: "justin"
    click_button "Create Account"

    expect(page).to have_content("Show me the justin")
  end
end
