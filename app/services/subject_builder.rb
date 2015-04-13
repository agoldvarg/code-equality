class SubjectBuilder
  def initialize(name)
    @name = name
    call
  end

  def call
    sanitize_name
    subject_create
    subject_tweets
  end

  def sanitize_name

  end

  def subject_create
    # create a new subject via their wiki status using the @name
  end

  def subject_tweets
    # pull in new tweets for the subject
  end
end