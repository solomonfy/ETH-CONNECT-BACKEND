class Eventsummary < ApplicationRecord
    belongs_to :host, class_name: "Member"
    belongs_to :event
end
