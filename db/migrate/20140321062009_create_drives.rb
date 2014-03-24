class CreateDrives < ActiveRecord::Migration
  def change
    create_table :drives do |t|
      t.string :drive_type
      t.string :on_behalfof
      t.string :status
      t.string :name
      t.string :organization
      t.string :npo_name
      t.string :drive_url
      t.text :description
      t.string :goods_type
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
