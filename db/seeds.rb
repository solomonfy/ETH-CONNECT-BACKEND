# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Announcement.destroy_all
Event.destroy_all
Invitation.destroy_all
Member.destroy_all
# Review.destroy_all


sol = Member.create(
    first_name: "Solomon", 
    last_name: "Sol", 
    username: "solomon", 
    email: "solomon@email.com", 
    password: "solomon", 
    family_size: 4,
    image: "",
    address: ""
)

bk = Member.create(
    first_name: "Bk", 
    last_name: "T", 
    username: "bk", 
    email: "bk@email.com", 
    password: "bk", 
    family_size: 5,
    image: "",
    address: ""
)

der = Member.create(
    first_name: "Der", 
    last_name: "T", 
    username: "der", 
    email: "der@email.com", 
    password: "der", 
    family_size: 5,
    image: "",
    address: ""
)


10.times do
    Member.create(
    first_name: Faker::Name.unique.first_name , 
    last_name: Faker::Name.unique.last_name , 
    username: Faker::Internet.username(specifier: 3...5), 
    email: Faker::Internet.unique.email, 
    password: "test", 
    family_size: 5,
    image: "",
    address: ""
)
end

event1 = Event.create(
    host: der,
    name: "Christmas", date: "", 
    location: Faker::Address.full_address, 
    event_type: "holyday",
    description: Faker::Lorem.paragraph(sentence_count: 2),
    summary: ""
)


event2 = Event.create(
    host: bk,
    name: "New year", 
    date: "", 
    location: Faker::Address.full_address, 
    event_type: "holyday",
    description: Faker::Lorem.paragraph(sentence_count: 2),
    summary: ""
)

event3 = Event.create(
    host: der,
    name: "Fasika", date: "", 
    location: Faker::Address.full_address, 
    event_type: "holyday",
    description: Faker::Lorem.paragraph(sentence_count: 2),
    summary: ""
)

Invitation.create(attendee: Member.first, event: event1)
Invitation.create(attendee: Member.second, event: event1)
Invitation.create(attendee: Member.all[11], event: event1)
Invitation.create(attendee: Member.fourth, event: event2)
Invitation.create(attendee: Member.first, event: event2)
Invitation.create(attendee: Member.all[10], event: event2)
Invitation.create(attendee: Member.all[8], event: event3)
Invitation.create(attendee: Member.all[5], event: event3)
Invitation.create(attendee: Member.all[6], event: event3)


# 10.times do
#     Announcement.create(
#         description: Faker::Lorem.paragraph(sentence_count: 5), 
#         member: Member.all.sample)
# end


# 10.times do
#     Review.create(
#         description: Faker::Lorem.paragraph(sentence_count: 5), 
#         event: event2, 
#         attendee_id: Member.all.sample,
#         likes: Faker::Number.within(range: 1..10))
# end


