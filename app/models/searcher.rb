class Searcher
  class_attribute :searcher
  self.searcher = Twitter::REST::Client

  attr_reader :results

  def initialize(search_term)
    @results = searcher.new(TWITTER_CONFIG).search(search_term).take(15)
  end
end
