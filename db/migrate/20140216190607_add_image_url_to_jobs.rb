class AddImageUrlToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :image_url, :string
  end
end
