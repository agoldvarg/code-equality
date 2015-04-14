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
    @results = Search.search(@q)
    if @results
      redirect_to subject_path(@results)
    else
      redirect_to new_subject_path
    end
  end

  def create
    
  end

  def new
    @subject = Subject.new
  end
end
