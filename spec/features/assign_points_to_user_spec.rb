require 'rails_helper'

RSpec.feature "admin can assign points" do
  scenario "Admin can add new points to a users points" do
    User.create(username: "justin", password: "justin", role: 1)
    User.create(username: "Stinette", password: "stinette")

    visit login_path
    fill_in "Username", with: "justin"
    fill_in "Password", with: "justin"
    click_button "Login"

    expect(page).to have_content("Welcome admin justin")

    visit users_path
    click_link "Stinette"

    select 10, from: "Points"
    click_button "Give Stinette points"

    standard_user = User.find_by(username: "Stinette")

    expect(standard_user.points).to eq(10)
  end

  scenario "Non admins cannot add new points to a users points" do
    User.create(username: "Stinette", password: "stinette")

    visit login_path
    fill_in "Username", with: "Stinette"
    fill_in "Password", with: "stinette"
    click_button "Login"

    expect(page).to have_content("Show me the Stinette")

    visit users_path
    click_link "Stinette"

    expect(page).to_not have_content("Give Stinette points")
  end
end
