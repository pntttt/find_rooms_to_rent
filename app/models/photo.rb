class Photo < ApplicationRecord
  scope :list, ->(room_id){where(room_id: room_id)}
  belongs_to :room

  has_attached_file :image, styles: {medium: Setting.photo.size.MEDIUM, thumb: Setting.photo.size.THUMB}
  validates_attachment_content_type :image, content_type: %r{\Aimage\/.*\z}
end
