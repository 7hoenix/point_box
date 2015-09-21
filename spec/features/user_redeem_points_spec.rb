require "rails_helper"

RSpec.feature "User redeems points" do

  scenario "A user can redeem points for rewards" do
    User.create(username: "justin", password: "justin", role: 1)
    User.create(username: "Stinette", password: "stinette")
    Reward.create(name: "brownies", cost: 200)

    visit login_path
    fill_in "Username", with: "justin"
    fill_in "Password", with: "justin"
    click_button "Login"

    visit users_path
    click_link "Stinette"

    expect(page).to_not have_content("Show me the Stinette")

    select 1000, from: "Points"
    click_button "Give Stinette points"

    click_link "Logout"

    visit login_path
    fill_in "Username", with: "Stinette"
    fill_in "Password", with: "stinette"
    click_button "Login"

    expect(page).to have_content("1000 points")

    visit rewards_path

    click_link "Redeem points for brownies"

    user = User.find_by(username: "Stinette")

    visit "/users/#{user.id}"

    expect(page).to have_content("800 points")

    expect(page).to have_content("brownies")
  end
end
