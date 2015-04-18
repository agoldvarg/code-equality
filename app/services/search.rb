class Search

  def initialize(query)
    @raw_query = query
  end

  def sanitize(raw_query)
    raw_query.gsub!(/ë/, 'e')
    raw_query.gsub!(/ö/, 'o')
    raw_query.gsub!(/ğ/, 'g')
    raw_query.gsub!(/Ö/, 'O')
    raw_query.split.map(&:capitalize).join(' ').strip
  end

  def search
    sanitized_query = sanitize(@raw_query)
    @result = Subject.where("name LIKE ?", "%#{sanitized_query}%").limit(1)[0]
  end

end
