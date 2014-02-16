require 'pry'
require 'flickr-objects'

countries = ["Albania", "Armenia", "Azerbaijan", "Belize", "Benin", "Botswana", "Burkina Faso", "Cambodia", "Cameroon", "China", "Colombia", "Costa Rica", "Dominican Republic", "Eastern Caribbean", "Ecuador", "El Salvador", "Ethiopia", "Fiji", "Georgia", "Ghana", "Guatemala", "Guinea", "Guyana", "Indonesia", "Jamaica", "Kenya", "Kosovo", "Kyrgyz Republic", "Lesotho", "Liberia", "Macedonia", "Madagascar", "Malawi", "Mexico", "Micronesia & Palau", "Moldova", "Mongolia", "Morocco", "Mozambique", "Namibia", "Nepal", "Nicaragua", "Panama", "Paraguay", "Peru", "Philippines", "Rwanda", "Samoa", "Senegal", "Sierra Leone", "South Africa", "Swaziland", "Tanzania", "Thailand", "The Gambia", "Togo", "Tonga", "Uganda", "Ukraine", "Vanuatu", "Zambia"]

Flickr.configure do |config|
  config.api_key       = "fa456297d84f8e556c40d26a43f49c04"
  config.shared_secret = "292ee8b44f3fe5a0"
end

peacecorps_id = '27814015@N03'
# user_id = '117752559@N03'

peacecorps = Flickr.people.find(peacecorps_id)
sets = peacecorps.sets

set_hash = Hash.new

countries.each do |country|
  sets.each do |set|
    if set.title.include? country
      set_hash[country] = set.id
      break
    end
  end
end

File.open('sets.txt', 'w') { |file| file.write(set_hash) }








