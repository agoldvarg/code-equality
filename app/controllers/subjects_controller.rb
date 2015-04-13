class SubjectsController < ApplicationController

  def about
  end

  def index
    @subjects_with = Subject.where(:has_wiki_page => true)
    @subjects_without = Subject.where(:has_wiki_page => false)
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def search
    @q = params[:search]
    # results will either be a new object, or an existing one
    # render the results
    @results = Search.search(@q)
    if @results
      # render subjects show page
    else
      # render form to create the subject
    end
  end

  def create
    # answers the search method if there was no subject matching query
  end
end
