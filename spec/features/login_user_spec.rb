require "rails_helper"

RSpec.feature "Login user" do
  scenario "with valid credentials" do
    User.create(username: "justin", password: "justin")

    visit login_path
    fill_in "Username", with: "justin"
    fill_in "Password", with: "justin"
    click_button "Login"

    expect(page).to have_content("Show me the justin")
  end

  scenario "with invalid credentials" do
    User.create(username: "justin", password: "justin")

    visit login_path
    fill_in "Username", with: "justin"
    fill_in "Password", with: "just"
    click_button "Login"

    expect(page).to_not have_content("Show me the justin")
  end
end
