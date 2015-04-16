class Search
  # SubjectBuilder.new(params[:name]) somewhere
  def self.search(search_term)
    # Check the db for the person, if they exist
    # reroute to that person's page
    # if not, use SubjectBuilder
    new_search_term = Search.clean_search(search_term)
    # convert query to slug search term
    Search.results(new_search_term)
  end

  def self.clean_search(search_field)
    # clean the query
    search_field.gsub!(/ë/, 'e')
    search_field.gsub!(/ö/, 'o')
    search_field.gsub!(/ğ/, 'g')
    search_field.gsub!(/Ö/, 'O')
    search_field.strip
  end

  def self.results(search_term)
    if Subject.find_by(name: search_term)
      Subject.find_by(name: search_term)
    else
      nil
    end
  end
end