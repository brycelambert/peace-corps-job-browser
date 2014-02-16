class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.boolean :req_status
      t.integer :fy
      t.integer :quarter
      t.integer :aa
      t.string :sector
      t.string :country
      t.string :req_id
      t.integer :vol_requested
      t.string :project_title
      t.text :project_description
      t.string :language
      t.date :nominate_deadline
      t.date :invitation_deadline
      t.date :staging_date
      t.text :conditions
      t.text :conditions_comments
      t.text :skills
    end
  end
end
