require 'csv'

file = Rails.root + "import.csv"

CSV.foreach(file, headers: true, encoding: 'windows-1251:utf-8') do |row|
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
    nomination_deadline: Date.strptime(row['NOMINATION DEADLINE'], "%d-%b-%Y"),
    invitation_deadline: Date.strptime(row['INVITATION DEADLINE'], "%d-%b-%Y"),
    staging_date: Date.strptime(row['STAGING DATE'], "%d-%b-%Y"),
    conditions_comments: row['CONDITIONS COMMENTS'],
    conditions: row['CONDITIONS'],
    skills: row['SKILLS'],
    project_description: row['DESCRIPTION']
  )
end

