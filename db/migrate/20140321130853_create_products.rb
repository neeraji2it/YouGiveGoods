class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_type
      t.string :status
      t.string :name
      t.text :description
      t.string :base_unit
      t.string :product_attributes
      t.string :image_url
      t.string :categories
      t.float :cost
      t.float :pounds
      t.integer :updated_by
      t.timestamps
    end
  end
end
