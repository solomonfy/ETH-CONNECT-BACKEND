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


profile_images = [
"https://cdn1.vectorstock.com/i/1000x1000/87/85/cartoon-funny-bear-vector-16998785.jpg",
"https://cdn3.vectorstock.com/i/1000x1000/94/97/funny-bear-cartoon-vector-16309497.jpg",
"https://image.freepik.com/free-vector/cute-little-dog-cartoon-isolated-white_143596-3.jpg",
"https://assetsds.cdnedge.bluemix.net/sites/default/files/styles/very_big_1/public/feature/images/cat_23.jpg?itok=nvtzx9Xx",
"https://cbsnews2.cbsistatic.com/hub/i/r/2010/12/03/79ed9c0e-a644-11e2-a3f0-029118418759/thumbnail/1200x630/cfe704cb9840686e553d1ae1197d1466/365073.jpg",
"https://i.pinimg.com/originals/f9/c2/66/f9c26616722f0b5ae43b87acc3a5ee1d.png",
"https://webstockreview.net/images/birds-clipart-animated-7.png"
]

sol = Member.create(
    first_name: "Solomon", 
    last_name: "Y", 
    username: "solomon", 
    email: "solomon@email.com", 
    password: "solomon", 
    family_size: 4,
    image: "https://images-na.ssl-images-amazon.com/images/I/41r0oAaPp0L._AC_.jpg",
    address: Faker::Address.full_address
)

bk = Member.create(
    first_name: "Bek", 
    last_name: "T", 
    username: "bek", 
    email: "bk@email.com", 
    password: "bek", 
    family_size: 5,
    image: "https://cdn5.vectorstock.com/i/1000x1000/53/24/profile-icon-male-emotion-avatar-man-cartoon-vector-15175324.jpg",
    address: Faker::Address.full_address
)

der = Member.create(
    first_name: "Der", 
    last_name: "T", 
    username: "der", 
    email: "der@email.com", 
    password: "der", 
    family_size: 5,
    image: "https://pickaface.net/gallery/avatar/20160731_021817_10_testing.png",
    address: Faker::Address.full_address
)


10.times do
    Member.create(
    first_name: Faker::Name.unique.first_name , 
    last_name: Faker::Name.unique.last_name , 
    username: Faker::Internet.username(specifier: 3...5), 
    email: Faker::Internet.unique.email, 
    password: "test", 
    family_size: Faker::Number.within(range: 1..5),
    image: profile_images.sample,
    address: Faker::Address.full_address
)
end

event1 = Event.create(
    host: der,
    name: "Christmas", date: '2020-12-20', 
    location: Faker::Address.full_address, 
    event_type: "holyday",
    description: Faker::Lorem.paragraph(sentence_count: 2),
    summary: ""
)


event2 = Event.create(
    host: bk,
    name: "New year", 
    date: '2020-10-23', 
    location: Faker::Address.full_address, 
    event_type: "holyday",
    description: Faker::Lorem.paragraph(sentence_count: 2),
    summary: ""
)

event3 = Event.create(
    host: der,
    name: "Fasika", date: '2020-11-15', 
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


