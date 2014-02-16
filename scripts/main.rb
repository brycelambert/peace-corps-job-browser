require 'csv'

file = "import.csv"

countries = String.new

CSV.foreach(file, headers: true, encoding: 'windows-1251:utf-8') do |row|
  contains = countries.include? row['POST'] unless row['POST'].nil?
  if row['POST'] && !contains
    new_country = "<option value='#{row['POST']}'>#{row['POST']}</option>"
    countries += (new_country + "\n")
  end
end

File.open('countries.txt', 'w') { |file| file.write(countries) }