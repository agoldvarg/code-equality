require 'nokogiri'
require 'open-uri'

parsed_subjects_array = []

File.read("./db/data/raw_data.csv").split("\n").each do |subject|
  # binding.pry
  first_name = subject.split(",")[1].strip
  last_name = subject.split(",")[0].strip
  parsed_subjects_array << "#{first_name} #{last_name}"
end

sanitized_subjects = []

parsed_subjects_array.each do |subject|
  subject.gsub!(/ë/, 'e')
  subject.gsub!(/ö/, 'o')
  subject.gsub!(/ğ/, 'g')
  subject.gsub!(/Ö/, 'O')
  sanitized_subjects << subject
end

sanitized_subjects.each do |subject|
  s = Subject.new(name: subject)
  base_wiki_url = "http://en.wikipedia.org/wiki/#{s.name.gsub(" ", "_")}"
  if s.has_page?(base_wiki_url)
    data = Nokogiri::HTML(open(base_wiki_url))
    s.bio = data.css("div#mw-content-text p:nth-child(2)").text.gsub(/\[[0-9]+\]/, '') + "  (Source: Wikipedia)"
    s.wiki_page_link = base_wiki_url
    s.has_wiki_page = true
  else
    s.has_wiki_page = false
    s.wiki_create_link = "https://en.wikipedia.org/w/index.php?title=#{s.name.gsub(" ", "_")}&action=edit"
  end
  s.save
end