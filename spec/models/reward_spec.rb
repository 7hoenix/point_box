require 'rails_helper'

RSpec.describe Reward, type: :model do
  it "has a name a cost" do
    reward = Reward.new(name: "brownies", cost: 10)

    expect(reward).to be_valid
  end

  it "must have a name" do
    reward = Reward.new(cost: 10)

    expect(reward).to_not be_valid
  end

  it "must have a cost" do
    reward = Reward.new(name: "brownies")

    expect(reward).to_not be_valid
  end

  it "must have a unique name" do
    Reward.create(name: "brownies", cost: 10)
    reward = Reward.new(name: "brownies", cost: 10)

    expect(reward).to_not be_valid
  end
end
