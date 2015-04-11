class SubjectsController < ApplicationController

  def about
  end

  def index
    @subjects_with = Subject.where(:has_wiki_page => true)
    @subjects_without = Subject.where(:has_wiki_page => false)
  end

  def show
  end

end
