class Member < ApplicationRecord

    has_secure_password

    validates :first_name, :last_name, :username, :email, presence: true
    validates :email, uniqueness: { case_sensitive: false }
    validates :username, uniqueness: { case_sensitive: false }


    has_many :hosting_events, foreign_key: :host_id, class_name: "Event", dependent: :destroy
    has_many :received_invitations, foreign_key: :attendee_id, class_name: "Invitation"


    # has_many :attendee_reviews, foreign_key: :attendee_id, class_name: "Review"
    has_many :announcements

    def full_name
        self.first_name + " " + self.last_name
    end


end