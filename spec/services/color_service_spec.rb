require "spec_helper.rb"

describe ColorService do
  describe ".to_phrase" do
    let(:color_phrase) { described_class.to_phrase(*colors) }

    context "when many colors are provided" do
      let(:colors) { %w(red white blue) }

      it "produces a natural language list of them" do
        expect(color_phrase).to eq("red, white, and blue")
      end
    end

    context "with duplicate colors" do
      let(:colors) { %w(red white blue white) }

      it "removes duplicate colors" do
        expect(color_phrase).to eq("red, white, and blue")
      end
    end

    context "with some capitalized colors" do
      let(:colors) { %w(Red White blue) }

      it "downcases the colors" do
        expect(color_phrase).to eq("red, white, and blue")
      end
    end

    context "with some blank colors" do
      let(:colors) { %w(red white blue white) + [nil, ""] }

      it "ignores the blanks" do
        expect(color_phrase).to eq("red, white, and blue")
      end
    end

    context "with zero colors" do
      let(:colors) { [] }

      it "produces an empty string" do
        expect(color_phrase).to eq("")
      end
    end
  end
end
