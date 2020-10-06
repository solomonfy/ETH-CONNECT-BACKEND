class Review < ApplicationRecord
    
    belongs_to :attendee, class_name: "Member"
    belongs_to :event
end
