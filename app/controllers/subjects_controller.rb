class SubjectsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new]

  def about
  end

  def index
    @subjects_with = Subject.where(:has_wiki_page => true).order(:sort_name)
    @subjects_without = Subject.where(:has_wiki_page => false).order(:sort_name)
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def search
    @subject = Search.new(params[:query]).search
    if @subject
      redirect_to subject_path(@subject)
    else
      flash[:message] = "We couldn't find #{params[:query]}."
      redirect_to sample_subject_path
    end
  end

  def create
    name = params[:subject][:name].split(' ').collect {|n| n.capitalize!}.join(' ')
    @subject = Subject.create(name: name, user_id: current_user.id)
    @subject.sort_name = @subject.sort_name
    @subject.save
    binding.pry

    sanitized_name = @subject.name
    sanitized_name.gsub!(/ë/, 'e')
    sanitized_name.gsub!(/ö/, 'o')
    sanitized_name.gsub!(/ğ/, 'g')
    sanitized_name.gsub!(/Ö/, 'O')

    base_wiki_url = "http://en.wikipedia.org/wiki/#{sanitized_name.gsub(" ", "_")}"
    
    if @subject.has_page?(base_wiki_url)
      data = Nokogiri::HTML(open(base_wiki_url))
      bio_text = data.css("div#mw-content-text p:nth-child(2)").text.gsub(/\[[0-9]+\]/, '')
      if !bio_text.empty?
        @subject.bio = bio_text + "  (Source: Wikipedia)"
      end
      @subject.wiki_page_link = base_wiki_url
      @subject.has_wiki_page = true
    else
      @subject.has_wiki_page = false
      @subject.wiki_create_link = "https://en.wikipedia.org/w/index.php?title=#{sanitized_name.gsub(" ", "_")}&action=edit"
    end
    @subject.save

    redirect_to subject_path(@subject)
  end

  def new
    @subject = Subject.new
  end

  def random
    ids = Subject.pluck(:id)
    @subject = Subject.find(ids.sample)
    render 'show'
  end

end
