require "spec_helper"

describe Tweet do
  let(:client) { double("TwitterClient", update: true) }

  before(:each) do
    allow(Twitter::REST::Client).to receive(:new).and_return(client)
  end

  describe "#post" do
    it "sends a tweet" do
      subject.post("foo")
      expect(client).to have_received(:update).with("foo")
    end
  end

  describe ".post" do
    let(:tweet) { double(post: true) }

    before(:each) do
      allow(described_class).to receive(:new).and_return(tweet)
    end

    it "initializes and instance and posts" do
      described_class.post("foo")
      expect(tweet).to have_received(:post).with("foo")
    end
  end
end
