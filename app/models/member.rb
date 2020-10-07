class Member < ApplicationRecord
    has_secure_password

    has_many :attendee_invitations, foreign_key: :host_id, class_name: 'Invitation'
    has_many :attendees, through: :attendee_invitations

    has_many :host_invitations, foreign_key: :attendee_id, class_name: 'Invitation'
    has_many :hosts, through: :host_invitations


    has_many :reviews, foreign_key: :attendee_id
    has_many :events, through: :reviews
    
   
    has_many :eventsummaries
    has_many :announcements



    #  if there is no review made by the user, Event can not be accessed directly, but through invitation

    # where I've been invited to an event
def i_am_invited_to
    self.host_invitations
end


# all invitations I made
def all_invitations_i_made
    self.attendee_invitations.map{|attendee| attendee}
end

def all_events_am_invited_to
    self.host_invitations.map{|i| i.event}
end



end