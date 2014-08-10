class Shoot < ActiveRecord::Base

  validates :artist, presence: true
  validates :description, presence: true
  validates :location, presence: true

  mount_uploader :shoot_image, ShootImageUploader
end
