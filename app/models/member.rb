class Member < ApplicationRecord

    has_secure_password

    # validates :first_name, :last_name, :username, :email, presence: { message: "%{value} must can't be empty" }
    # validates :email, uniqueness: { case_sensitive: false }
    # validates :username, uniqueness: { case_sensitive: false }


    has_many :hosting_events, foreign_key: :host_id, class_name: "Event"
    has_many :received_invitations, foreign_key: :attendee_id, class_name: "Invitation"


    # has_many :attendee_reviews, foreign_key: :attendee_id, class_name: "Review"
    # has_many :announcements



end