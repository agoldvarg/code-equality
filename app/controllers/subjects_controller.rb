class SubjectsController < ApplicationController

  def about
  end

  def index
    @subjects = Subject.all
  end

  def show
    @subject = Subject.find(params[:id])
  end

end
