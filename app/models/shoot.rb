class Shoot < ActiveRecord::Base

  validates :artist, presence: true
  validates :description, presence: true
  validates :location, presence: true

  mount_uploader :shoot_image, ShootImageUploader
  mount_uploader :video, VideoUploader
  #process_in_background :video

  scope :published, -> { where(is_published: true) }

  def published?
    is_published
  end
end
