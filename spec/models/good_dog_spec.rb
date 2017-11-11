require "spec_helper.rb"

describe GoodDog do
  let(:good_dog) { build(:good_dog) }
  let(:age_info) { double("Age Info") }

  before(:each) do
    allow(AgeService).to receive(:new).and_return(age_info)
    allow(age_info).to receive(:adjectival_age_phrase)
    allow(age_info).to receive(:predicate_age_phrase)
  end

  it "has a valid factory" do
    expect(good_dog).to be_valid
  end

  describe "#adjectival_age" do
    before(:each) do
      good_dog.adjectival_age
    end

    it "looks up the neighborhood for the dog's zipcode" do
      expect(AgeService).to have_received(:new).
        with(good_dog.birth_year, good_dog.birth_month)
      expect(age_info).to have_received(:adjectival_age_phrase)
    end
  end

  describe "#age" do
    before(:each) do
      good_dog.age
    end

    it "looks up the neighborhood for the dog's zipcode" do
      expect(AgeService).to have_received(:new).
        with(good_dog.birth_year, good_dog.birth_month)
      expect(age_info).to have_received(:predicate_age_phrase)
    end
  end

  describe "#neighborhood" do
    before(:each) do
      allow(NeighborhoodService).to receive(:from_zip)
      good_dog.neighborhood
    end

    it "looks up the neighborhood for the dog's zipcode" do
      expect(NeighborhoodService).to have_received(:from_zip).with(good_dog.zip_code)
    end
  end

  describe "#color" do
    before(:each) do
      allow(ColorService).to receive(:to_phrase)
      good_dog.color
    end

    it "looks up the neighborhood for the dog's zipcode" do
      expect(ColorService).to have_received(:to_phrase).with(
        good_dog.color_1, good_dog.color_2, good_dog.color_3
      )
    end
  end
end
