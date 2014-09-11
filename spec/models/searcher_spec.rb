require 'rails_helper'

describe Searcher do
  describe "#results" do
    it "returns results from a Twitter search" do
      searcher = Searcher.new("awesome search")

      expect(searcher.results.length).to eq 15
    end
  end
end
