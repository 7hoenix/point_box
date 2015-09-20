require 'rails_helper'

RSpec.feature "total points" do
  scenario "a user can see their total number of points" do
    User.create(username: 'stinette', password: 'stinette')

    visit login_path
    fill_in "Username", with: "stinette"
    fill_in "Password", with: "stinette"
    click_button "Login"

    expect(page).to have_content("0 points")
  end
end
