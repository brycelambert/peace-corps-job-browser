require 'csv'

file = Rails.root + "import.csv"

CSV.foreach(file, headers: true, encoding: 'windows-1251:utf-8') do |row|

  nomination_deadline = Date.strptime(row['NOMINATION DEADLINE'], "%d-%b-%Y") unless row['NOMINATION DEADLINE'].nil?
  invitation_deadline = Date.strptime(row['INVITATION DEADLINE'], "%d-%b-%Y") unless row['INVITATION DEADLINE'].nil?
  staging_date = Date.strptime(row['STAGING DATE'], "%d-%b-%Y") unless row['STAGING DATE'].nil?

  unless Job.last.nil? || row['PROJECT TITLE'] == ''
    if row['PROJECT TITLE'] == Job.last.project_title
      increase = row['vol_requested'].to_i
      Job.last.vol_requested += increase
    else
      Job.create(
      req_status: row['CURRENT REQ STATUS'] == 'Open',
      fy: row['FY'].to_i,
      quarter: row['Q'].to_i,
      aa: row['AA'].to_i,
      sector: row['SECTOR'],
      country: row['POST'],
      req_id: row['REQ ID'],
      vol_requested: row['VOL REQUESTED'].to_i,
      project_title: row['PROJECT TITLE'],
      language: row['LANGUAGE'],
      nomination_deadline: nomination_deadline,
      invitation_deadline: invitation_deadline,
      staging_date: staging_date,
      conditions_comments: row['CONDITIONS COMMENTS'],
      conditions: row['CONDITIONS'],
      skills: row['SKILLS'],
      project_description: row['DESCRIPTION']
    )
    end
  end

  if Job.last == nil
    Job.create(
      req_status: row['CURRENT REQ STATUS'] == 'Open',
      fy: row['FY'].to_i,
      quarter: row['Q'].to_i,
      aa: row['AA'].to_i,
      sector: row['SECTOR'],
      country: row['POST'],
      req_id: row['REQ ID'],
      vol_requested: row['VOL REQUESTED'].to_i,
      project_title: row['PROJECT TITLE'],
      language: row['LANGUAGE'],
      nomination_deadline: nomination_deadline,
      invitation_deadline: invitation_deadline,
      staging_date: staging_date,
      conditions_comments: row['CONDITIONS COMMENTS'],
      conditions: row['CONDITIONS'],
      skills: row['SKILLS'],
      project_description: row['DESCRIPTION']
    )
  end
end


#Fetch Photo Urls

sets = {"Albania"=>"72157625948454014", "Armenia"=>"72157625948822804", "Azerbaijan"=>"72157625949058880", "Belize"=>"72157625949111704", "Benin"=>"72157625949218788", "Botswana"=>"72157625949473824", "Burkina Faso"=>"72157625829245211", "Cambodia"=>"72157625829653341", "Cameroon"=>"72157625955145636", "China"=>"72157625873867407", "Colombia"=>"72157625999324880", "Costa Rica"=>"72157626217354985", "Dominican Republic"=>"72157626217383233", "Eastern Caribbean"=>"72157626217574219", "Ecuador"=>"72157626342422094", "El Salvador"=>"72157626223718125", "Ethiopia"=>"72157626348576010", "Fiji"=>"72157626223744017", "Georgia"=>"72157627179714252", "Ghana"=>"72157626348952626", "Guatemala"=>"72157626982631414", "Guinea"=>"72157626225573317", "Guyana"=>"72157626225979291", "Indonesia"=>"72157626226129743", "Jamaica"=>"72157627054679383", "Kenya"=>"72157627054457883", "Lesotho"=>"72157626366446157", "Liberia"=>"72157626491509378", "Macedonia"=>"72157626367282207", "Madagascar"=>"72157626367717163", "Malawi"=>"72157626492340750", "Mexico"=>"72157626523059803", "Moldova"=>"72157626374627099", "Mongolia"=>"72157626577186316", "Morocco"=>"72157627054563327", "Mozambique"=>"72157626452666771", "Namibia"=>"72157626577400894", "Nepal"=>"72157631535931316", "Nicaragua"=>"72157626452998349", "Panama"=>"72157626452827639", "Paraguay"=>"72157626577753828", "Peru"=>"72157626577875020", "Philippines"=>"72157626578014562", "Rwanda"=>"72157626506866121", "Samoa"=>"72157626506884081", "Senegal"=>"72157626632048448", "Sierra Leone"=>"72157626437010200", "South Africa"=>"72157626639197054", "Swaziland"=>"72157626639439120", "Tanzania"=>"72157626515021179", "Thailand"=>"72157626639667544", "The Gambia"=>"72157626348650222", "Togo"=>"72157626639794840", "Tonga"=>"72157627055154759", "Uganda"=>"72157626515546519", "Ukraine"=>"72157626515579531", "Vanuatu"=>"72157626515566817", "Zambia"=>"72157626515595287"}

Flickr.configure do |config|
  config.api_key       = "fa456297d84f8e556c40d26a43f49c04"
  config.shared_secret = "292ee8b44f3fe5a0"
end

peacecorps_id = '27814015@N03'

sets.each do |set|
  photos = Flickr.sets.get_photos(set[1], sizes: true)

  Job.where(country: set[0]).each do |job|
    random_photo = photos[rand(0...photos.length)]
    image_url = "http://farm#{random_photo.farm}.staticflickr.com/#{random_photo.server}/#{random_photo.id}_#{random_photo.secret}.jpg"
    Job.find(job.id).update(image_url: image_url)
   end
end



