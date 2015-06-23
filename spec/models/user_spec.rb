require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a name" do
    user = User.create(name: "dude")
    expect(user.name).to eq("dude")
  end

  it "has a description" do
    user = User.create(description: "looking for a pair ya know")
    expect(user.description).to eq("looking for a pair ya know")
  end

  it "has an image" do
    user = User.create(image: "image.com")
    expect(user.image).to eq("image.com")
  end

  it "has an uid" do
    user = User.create(uid: 9)
    expect(user.uid).to eq(9)
  end
end
