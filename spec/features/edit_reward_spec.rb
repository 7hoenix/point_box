require "rails_helper"

RSpec.feature "Edit reward" do
  scenario "An admin edits a reward" do
    User.create(username: "justin", password: "justin", role: 1)
    Reward.create(name: "brownies", cost: 10)

    visit login_path
    fill_in "Username", with: "justin"
    fill_in "Password", with: "justin"
    click_button "Login"

    visit rewards_path

    expect(page).to have_content("brownies: 10")

    click_link "Edit brownies"

    fill_in "Name", with: "gooey brownies"
    select 100, from: "Cost"
    click_button "Change reward"

    expect(page).to have_content("gooey brownies: 100")
  end

  scenario "A normal user cannot edit a reward" do
    User.create(username: "stinette", password: "stinette")
    reward = Reward.create(name: "brownies", cost: 10)

    visit login_path
    fill_in "Username", with: "stinette"
    fill_in "Password", with: "stinette"
    click_button "Login"

    visit rewards_path

    expect(page).to_not have_content("Edit brownies")

    visit edit_admin_reward_path(reward)

    expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end
