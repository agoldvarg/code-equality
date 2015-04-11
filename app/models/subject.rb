class Subject < ActiveRecord::Base
  has_many  :tweets

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

end
