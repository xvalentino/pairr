require 'rails_helper'

RSpec.describe Pair, type: :model do
  it "can bump the status up" do
    pair = Pair.create(user_id: 1, potential_match_id: 2)

    expect(pair.status).to eq(0)
    expect(pair.count).to eq(0)
    pair.up
    expect(pair.status).to eq(1)
    expect(pair.count).to eq(1)
  end

  it "can bump the status down" do
    pair = Pair.create(user_id: 1, potential_match_id: 2)

    expect(pair.status).to eq(0)
    expect(pair.count).to eq(0)
    pair.down
    expect(pair.status).to eq(0)
    expect(pair.count).to eq(1)
  end
end
