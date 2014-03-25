class Campaign < ActiveRecord::Base
  has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :logo, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  
  has_attached_file :image
  validates_attachment_content_type :image,:styles => { :medium => "300x300>", :thumb => "100x100>" }, :content_type => ["image/jpg", "image/jpeg", "image/png", "video/mp4"]
  
end
