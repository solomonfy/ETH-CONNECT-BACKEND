# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Announcement.destroy_all
Event.destroy_all
Eventsummary.destroy_all
Invitation.destroy_all
Member.destroy_all
Review.destroy_all


sol = Member.create(
    first_name: "Solomon", 
    last_name: "Sol", 
    username: "solomon", 
    email: "solomon@email.com", 
    password_digest: "solomon", 
    family_size: 4,
    image: ""
)

bk = Member.create(
    first_name: "Bk", 
    last_name: "T", 
    username: "bk", 
    email: "bk@email.com", 
    password_digest: "bk", 
    family_size: 5,
    image: ""
)

der = Member.create(
    first_name: "Der", 
    last_name: "T", 
    username: "der", 
    email: "der@email.com", 
    password_digest: "der", 
    family_size: 5,
    image: ""
)


10.times do
    Member.create(
    first_name: Faker::Name.unique.first_name , 
    last_name: Faker::Name.unique.last_name , 
    username: Faker::Internet.username(specifier: 3...5), 
    email: Faker::Internet.unique.email, 
    password_digest: "test", 
    family_size: 5,
    image: ""
)
end

event1 = Event.create(
    name: "Christmas", date: "", 
    location: Faker::Address.full_address, 
    event_type: "holyday",
    description: Faker::Lorem.paragraph(sentence_count: 2)
)
event2 = Event.create(
    name: "New year", 
    date: "", 
    location: Faker::Address.full_address, 
    event_type: "holyday",
    description: Faker::Lorem.paragraph(sentence_count: 2)
)

Invitation.create(host: der, attendee: Member.first, event: event1)
Invitation.create(host: der, attendee: Member.second, event: event1)
Invitation.create(host: der, attendee: Member.all[11], event: event1)
Invitation.create(host: der, attendee: Member.fourth, event: event1)
Invitation.create(host: bk, attendee: Member.first, event: event2)
Invitation.create(host: bk, attendee: Member.all[10], event: event2)


10.times do
    Announcement.create(
        description: Faker::Lorem.paragraph(sentence_count: 5), 
        member: Member.all.sample)
end

10.times do
    Eventsummary.create(
        description: Faker::Lorem.paragraph(sentence_count: 5), 
        event: event1, 
        member_id: Member.all.sample)
end

10.times do
    Review.create(
        description: Faker::Lorem.paragraph(sentence_count: 5), 
        event: event2, 
        attendee_id: Member.all.sample,
        likes: Faker::Number.within(range: 1..10))
end


