require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#is_admin?" do
    it "returns true if the user is an admin" do
      admin = User.create(username: "justin", password: "justin", role: 1)

      expect(admin.is_admin?).to be true
    end

    it "returns false if the user is a hacker like stinette" do
      hacker_stinette = User.create(username: "stinette", password: "stinette")

      expect(hacker_stinette.is_admin?).to be false
    end
  end

  describe "has attributes" do
    it "has a no points and a role of default by default" do
      stinette = User.create(username: "stinette", password: "stinette")

      expect(stinette.role).to eq("default")
      expect(stinette.points).to eq(0)
    end
  end
end
