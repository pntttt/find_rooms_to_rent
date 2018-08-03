class Photo < ApplicationRecord
  scope :list, ->(room_id){where(room_id: room_id)}
  belongs_to :room

  has_attached_file :image, 
    :storage => :cloudinary, 
    :cloudinary_credentials => Rails.root.join("config/cloudinary.yml"),
    :styles => {medium: Settings.photo.size.MEDIUM, thumb: Settings.photo.size.THUMB},
    :path => ':id/:style/:filename'
  validates_attachment_content_type :image, content_type: %r{\Aimage\/.*\z}
end
