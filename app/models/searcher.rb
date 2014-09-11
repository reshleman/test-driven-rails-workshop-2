class Searcher
  attr_reader :results

  def initialize(search_term)
    @results = Twitter::REST::Client.
      new(TWITTER_CONFIG).
      search(search_term).
      take(15)
  end
end
