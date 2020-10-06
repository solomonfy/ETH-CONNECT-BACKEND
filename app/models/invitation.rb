class Invitation < ApplicationRecord

    belongs_to :host, class_name: "Member"
    belongs_to :attendee, class_name: "Member"
    belongs_to :event



end
