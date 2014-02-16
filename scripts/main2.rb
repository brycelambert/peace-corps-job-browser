require 'csv'

file = "import.csv"

countries = ""
id = 1

CSV.foreach(file, headers: true, encoding: 'windows-1251:utf-8') do |row|
  contains = countries.include? row['POST'] unless row['POST'].nil?
  if row['POST'] && !contains
    new_country = "{ id: '#{id}', label: '#{row['POST']}' },"
    countries += (new_country + "\n")
    id += 1
  end
end

File.open('countries.txt', 'w') { |file| file.write(countries) }