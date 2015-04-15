class Subject < ActiveRecord::Base
  # has_many  :tweets
  # after_create :pull_tweets

  def has_page?(url)
    begin
      html = open(url)
      true
    rescue OpenURI::HTTPError => e
      if e.message == '404 Not Found'
        false
      end
    end
  end

  def pull_tweets
    tweets = []
    client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV["twitter_key"]
      config.consumer_secret = ENV["twitter_secret"]
    end
    client.search(self.name, result_type: type = "mixed", lang: "en").take(10).each do |tweet|
      html = client.oembed(tweet.id).html
      tweets << html if !tweets.include?(html) && tweet.text.include?(self.name)
    end
    tweets
  end

end
