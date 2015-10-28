class Profilpic < ActiveRecord::Base
  belongs_to :user
  attr_accessible :gallery_id, :name, :image, :remote_image_url
  mount_uploader :image, ImageUploader
end
