
parsed_subjects_array = []

File.read("./db/data/raw_data.csv").split("\n").each do |subject|
  first_name = subject.split(",")[1].strip
  last_name = subject.split(",")[0].strip
  parsed_subjects_array << "#{first_name} #{last_name}"
end

parsed_subjects_array.collect do |subject|
  subject.gsub!(/ë/, 'e').gsub!(/ö/, 'o').gsub!(/ğ/, 'g').gsub!(/Ö/, 'O')
end
