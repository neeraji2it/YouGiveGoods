class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :campaign_type
      t.string :status
      t.string :name
      t.string :organization
      t.string :npo_name
      t.string :campaign_url
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.float :goal
      t.integer :goal_unit_id
      t.integer :updated_by
      t.attachment :logo
      t.attachment :image
      t.timestamps
    end
  end
end
