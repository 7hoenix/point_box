require 'rails_helper'

RSpec.feature "Logout user" do
  scenario "when a user is logged in" do
    User.create(username: "justin", password: "justin")

    visit login_path
    fill_in "Username", with: "justin"
    fill_in "Password", with: "justin"
    click_button "Login"

    expect(page).to have_content("Show me the justin")

    click_link "Logout"

    expect(page).to_not have_content("Show me the justin")
  end

  scenario "when a user is not logged in" do
    visit root_path

    expect(page).to_not have_content("Show me the justin")
  end
end
