require "spec_helper.rb"

describe GoodDog do
  it "has a valid factory" do
    expect(build(:good_dog)).to be_valid
  end
end
