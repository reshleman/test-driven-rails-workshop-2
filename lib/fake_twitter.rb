class FakeTwitter
  @@results = {}

  def initialize(_config_params)
  end

  def search(search_term)
    @@results.fetch(search_term, [])
  end

  def self.[]=(key, value)
    @@results[key] = value.map { |twitter_hash| Twitter::Tweet.new(twitter_hash.merge(id: 123456)) }
  end

  def self.clear
    @@results = {}
  end
end
