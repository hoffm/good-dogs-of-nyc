require "spec_helper.rb"

describe Neighborhoods do
  describe ".from_zip" do
    context "when the zip is an NYC zip" do
      it "produces a neighborhood" do
        expect(described_class.from_zip("11236")).to eq("Canarsie")
      end
    end

    context "when the zip is not an NYC zip" do
      it "raises an exception" do
        expect { described_class.from_zip("90210") }.to(
          raise_exception(described_class::NonNycZipError),
        )
      end
    end
  end
end
