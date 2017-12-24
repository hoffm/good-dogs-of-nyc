require "spec_helper"

describe AgeService do
  let(:time_now) { described_class::REF_DATE }

  before(:each) do
    allow(Time).to receive(:now).and_return(time_now)
  end

  describe ".new" do
    context "with a birth date in the future" do
      it "raises and error" do
        expect { AgeService.new(2020, 1) }.to raise_exception(
          described_class::NegativeAgeError,
        )
      end
    end

    context "with a missing birth month" do
      it "sets a month of 1" do
        expect(AgeService.new(2010, nil).month).to eq(1)
      end
    end
  end

  describe "#predicate_age_phrase" do
    let(:age_phrase) do
      described_class.new(birth_year, birth_month).predicate_age_phrase
    end

    context "with a birthday more than two years ago" do
      let(:birth_year) { 2010 }
      let(:birth_month) { 2 }

      it "returns an age in years" do
        expect(age_phrase).to eq("6 years old")
      end
    end

    context "with a birthday less than two years ago" do
      let(:birth_year) { 2015 }
      let(:birth_month) { 2 }

      it "returns an age in months" do
        expect(age_phrase).to eq("14 months old")
      end
    end

    context "with a birthday that has not already passed this year" do
      let(:birth_year) { 2010 }
      let(:birth_month) { 8 }

      it "returns an age in years" do
        expect(age_phrase).to eq("5 years old")
      end
    end
  end

  describe "#adjectival_age_phrase" do
    let(:age_phrase) do
      described_class.new(birth_year, birth_month).adjectival_age_phrase
    end

    context "with a birthday more than two years ago" do
      let(:birth_year) { 2010 }
      let(:birth_month) { 2 }

      it "returns an adjectival age in years" do
        expect(age_phrase).to eq("6-year-old")
      end
    end

    context "with a birthday less than two years ago" do
      let(:birth_year) { 2015 }
      let(:birth_month) { 2 }

      it "returns an adjectival age in months" do
        expect(age_phrase).to eq("14-month-old")
      end
    end
  end
end
