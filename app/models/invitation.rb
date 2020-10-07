class Invitation < ApplicationRecord

    belongs_to :event
    belongs_to :attendee, foreign_key: :attendee_id, class_name: "Member"



end
