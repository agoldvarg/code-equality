
parsed_csv = CSVScraper.new.all

parsed_csv.collect do |subject|
  subject.gsub!(/ë/, 'e').gsub!(/ö/, 'o').gsub!(/ğ/, 'g').gsub!(/Ö/, 'O')
end

