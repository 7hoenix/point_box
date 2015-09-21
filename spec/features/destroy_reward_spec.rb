require "rails_helper"

RSpec.feature "Destory reward" do
  scenario "An admin clicks delete" do
    User.create(username: "justin", password: "justin", role: 1)
    Reward.create(name: "brownies", cost: 10)

    visit login_path
    fill_in "Username", with: "justin"
    fill_in "Password", with: "justin"
    click_button "Login"

    visit rewards_path

    expect(page).to have_content("brownies: 10")

    click_link "Delete brownies"

    expect(page).to_not have_content("brownies: 10")
  end

  scenario "a normal user cannot delete" do
    User.create(username: "stinette", password: "stinette")
    Reward.create(name: "brownies", cost: 10)

    visit login_path
    fill_in "Username", with: "stinette"
    fill_in "Password", with: "stinette"
    click_button "Login"

    visit rewards_path

    expect(page).to_not have_content("Delete brownies")
  end
end
