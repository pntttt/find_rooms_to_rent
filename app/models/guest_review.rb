class GuestReview < Review
  belongs_to :guest, class_name: User.name
  scope :reviewed, ->(reservation_id, host_id){where reservation_id: reservation_id, host_id: host_id}
end
