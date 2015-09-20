require "rails_helper"

RSpec.feature "An admin creates a new reward" do
  scenario "and is redirected to the reward page" do
    User.create(username: "justin", password: "justin", role: 1)

    visit login_path
    fill_in "Username", with: "justin"
    fill_in "Password", with: "justin"
    click_button "Login"

    click_link "Create new reward"

    fill_in "Name", with: "brownies"
    select 10, from: "Cost"
    click_button "Create reward"

    expect(page).to have_content("brownies: 10")
  end
end
