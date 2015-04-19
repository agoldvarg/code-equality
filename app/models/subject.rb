require 'open-uri'
require 'nokogiri'

class Subject < ActiveRecord::Base
  belongs_to :user

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

  def sort_name
    name_array = self.name.split(' ').reverse!
    result = name_array.shift
    name_array.reverse!
    for i in 0...name_array.length
      result << name_array[i]
    end
    result.capitalize!
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

  def pull_articles
    base_url = "http://api.nytimes.com/svc/search/v2/articlesearch.json?q="
    q = self.name.gsub(" ","+")
    json = JSON.load(open(base_url + q + "&sort=newest&api-key=#{ENV["nyt_key"]}"))
    json["response"]["docs"].first(5)
  end

end
