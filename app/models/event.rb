class Event < ApplicationRecord
    

    has_many :reviews
    has_many :invitations
    has_many :attendees, foreign_key: :attendee_id, class_name: "Member", through: :invitations
    belongs_to :host, foreign_key: :host_id, class_name: "Member"

end
