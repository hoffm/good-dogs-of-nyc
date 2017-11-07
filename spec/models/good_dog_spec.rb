require "spec_helper.rb"

describe GoodDog do
  let(:good_dog) { build(:good_dog) }

  it "has a valid factory" do
    expect(good_dog).to be_valid
  end

  describe "#neighborhood" do
    before(:each) do
      allow(Neighborhoods).to receive(:from_zip)
      good_dog.neighborhood
    end

    it "looks up the neighborhood for the dog's zipcode" do
      expect(Neighborhoods).to have_received(:from_zip).with(good_dog.zip_code)
    end
  end
end
