require 'rails_helper'

describe Searcher do
  describe "#results" do
    it "returns results from a Twitter search" do
      searcher = Searcher.new("awesome search")

      expect(searcher.results.length).to eq 15
    end
  end

  describe "using a custom searcher" do
    it "invoking search returns results from the searcher passed" do
      fake_searcher_instance = stub("fake searcher instance", search: [1,2,3])
      fake_searcher = stub("fake searcher", new: fake_searcher_instance)
      Searcher.searcher = fake_searcher

      searcher = Searcher.new("search term")
      expect(searcher.results).to eq fake_searcher_instance.search
    end
  end
end
