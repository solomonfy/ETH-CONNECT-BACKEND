class Event < ApplicationRecord
    has_many :invitations
    has_many :reviews
    has_many :attendees, class_name: "Member", through: :reviews
    has_many :evensummaries
    # has_many :attendees, through: :reviews


    def attendees
        self.invitations.map{|i| i.attendee}
    end
    # total number of attendants for an event (family included)
    def all_attendants
        self.invitations.map{|i| i.attendee.family_size}.sum
    end





end
