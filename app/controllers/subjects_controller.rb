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
    @subject = Search.new(params[:query]).search
    if @subject
      redirect_to subject_path(@subject)
    else
      flash[:message] = "We couldn't find #{params[:query]} - but here's someone you should checkout!"
      redirect_to sample_subject_path
    end
  end

  def create
  end

  def new
    @subject = Subject.new
  end

  def random
    ids =  Subject.pluck(:id)
    @subject = Subject.find(ids.sample)
    render 'show'
  end

end
