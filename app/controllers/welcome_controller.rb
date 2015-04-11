class WelcomeController < ApplicationController
  
  def index
    @subjects = Subject.all
  end

end
