require "spec_helper.rb"

describe Breeds do
  describe ".clean" do
    let(:breed) { described_class.clean(raw_breed) }

    context "when when the raw breed is already fine" do
      let(:raw_breed) { "Pekingese" }

      it "leaves it alone" do
        expect(breed).to eq("Pekingese")
      end
    end

    context "when the raw breed is reversed" do
      let(:raw_breed) { "Schnauzer, Miniature" }

      it "reverses it back" do
        expect(breed).to eq("Miniature Schnauzer")
      end
    end

    context "when the raw breed is all caps" do
      let(:raw_breed) { "MALTIPOO" }

      it "titlecases" do
        expect(breed).to eq("Maltipoo")
      end
    end

    context "when the raw breed has an X" do
      let(:raw_breed) { "Hound X" }

      it "replaces the X with mix" do
        expect(breed).to eq("Hound Mix")
      end
    end

    context "when the raw breed needs multiple transformations" do
      let(:raw_breed) { "PIT BULL X" }

      it "does them all" do
        expect(breed).to eq("Pit Bull Mix")
      end
    end
  end
end
