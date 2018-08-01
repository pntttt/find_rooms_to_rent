class Review < ApplicationRecord
  scope :guest_review, -> (user_id){where type: "GuestReview", host_id: user_id}
  scope :host_review, -> (user_id){where type: "HostReview", guest_id: user_id}
end
