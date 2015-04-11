parsed_subjects_array = []

File.read("./db/data/raw_data.csv").split("\n").each do |subject|
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
  Subject.create(name: subject)
end
