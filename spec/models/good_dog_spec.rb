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

  describe "#color_phrase" do
    before(:each) do
      allow(Colors).to receive(:to_phrase)
      good_dog.color_phrase
    end

    it "looks up the neighborhood for the dog's zipcode" do
      expect(Colors).to have_received(:to_phrase).with(
        good_dog.color_1, good_dog.color_2, good_dog.color_3
      )
    end
  end

  describe "#breed_phrase" do
    before(:each) do
      allow(Breeds).to receive(:clean)
      good_dog.breed_phrase
    end

    it "looks up the neighborhood for the dog's zipcode" do
      expect(Breeds).to have_received(:clean).with(good_dog.breed)
    end
  end
end
