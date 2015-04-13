class Search
  # SubjectBuilder.new(params[:name]) somewhere
  def self.search(search_term)
    # Check the db for the person, if they exist
    # reroute to that person's page
    # if not, use SubjectBuilder
    @new_search_term = clean_search(search_term)
    # convert query to slug search term
    
  end

  def clean_search(search_field)
    # clean the query
  end
end