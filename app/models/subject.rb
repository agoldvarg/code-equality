class Subject < ActiveRecord::Base
  has_many  :tweets
  after_create :pull_tweets

  def has_page?(url)
    # binding.pry
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

  end
end
