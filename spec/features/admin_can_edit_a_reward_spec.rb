require "rails_helper"

RSpec.feature "An admin edits a record" do
  scenario "and is redirected to the reward page" do
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
end
