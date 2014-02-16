require 'csv'

file = Rails.root + "import.csv"

CSV.foreach(file, headers: true, encoding: 'windows-1251:utf-8') do |row|

  nomination_deadline = Date.strptime(row['NOMINATION DEADLINE'], "%d-%b-%Y") unless row['NOMINATION DEADLINE'].nil?
  invitation_deadline = Date.strptime(row['INVITATION DEADLINE'], "%d-%b-%Y") unless row['INVITATION DEADLINE'].nil?
  staging_date = Date.strptime(row['STAGING DATE'], "%d-%b-%Y") unless row['STAGING DATE'].nil?

  unless Job.last.nil?
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

