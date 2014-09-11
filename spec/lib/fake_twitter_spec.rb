require 'rails_helper'

describe FakeTwitter do
  describe "#search" do
    it "returns an array of results" do
      fake = FakeTwitter.new({params: "param"})
      results = fake.search("term")

      expect(results).to be_an Array
    end
  end

  describe ".[]=" do
    it "sets the results for a given search term" do
      FakeTwitter["term"] = [{"text" => "Great"}]
      fake = FakeTwitter.new({params: "param"})
      results = fake.search("term")

      expect(results).to be_an Array
      expect(results.length).to eq 1
      expect(results.first).to be_a Twitter::Tweet
    end
  end

  describe ".clear" do
    it "empties the results" do
      FakeTwitter["term"] = [{text: "Great"}]
      FakeTwitter.clear
      results = FakeTwitter.new({params: "param"}).search("term")

      expect(results).to be_empty
    end
  end
end
