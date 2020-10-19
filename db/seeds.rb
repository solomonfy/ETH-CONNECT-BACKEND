# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Announcement.destroy_all
Event.destroy_all
Invitation.destroy_all
Member.destroy_all
Review.destroy_all
Photo.destroy_all


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
    name: "Christmas", date: '2020-12-26', 
    location: Faker::Address.full_address, 
    event_type: "holyday",
    description: Faker::Lorem.paragraph(sentence_count: 2),
    event_card: "https://images.unsplash.com/photo-1543858710-af0479276bed?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
    summary: ""
)


event2 = Event.create(
    host: bk,
    name: "New year", 
    date: '2021-01-01', 
    location: Faker::Address.full_address, 
    event_type: "holyday",
    description: Faker::Lorem.paragraph(sentence_count: 2),
    event_card: "https://liyusport.com/wp-content/uploads/2019/09/liyu-new-year.jpeg-24-614x325.jpg",
    summary: ""
)

event3 = Event.create(
    host: sol,
    name: "Final project showcase", date: '2020-10-22', 
    location: "Over Zoom", 
    event_type: "Graduation",
    description: Faker::Lorem.paragraph(sentence_count: 2),
    event_card: "https://res.cloudinary.com/springboard-images/image/upload/q_auto,f_auto,fl_lossy/wordpress/2019/07/sb-blog-programming.png",
    summary: ""
)
event4 = Event.create(
    host: sol,
    name: "Graduation", date: '2020-10-23', 
    location: Faker::Address.full_address, 
    event_type: "holyday",
    description: Faker::Lorem.paragraph(sentence_count: 2),
    event_card: "https://www.wikihow.com/images/thumb/0/08/Become-a-Software-Engineer-Step-1-Version-2.jpg/v4-460px-Become-a-Software-Engineer-Step-1-Version-2.jpg",
    summary: ""
)

Invitation.create(attendee: Member.first, message: Faker::Lorem.paragraph(sentence_count: 1), event: event1, card: "")
Invitation.create(attendee: Member.second, message: Faker::Lorem.paragraph(sentence_count: 2), event: event1, card: "")
Invitation.create(attendee: Member.all[11], message: Faker::Lorem.paragraph(sentence_count: 3), event: event1, card: "")
Invitation.create(attendee: Member.fourth, message: Faker::Lorem.paragraph(sentence_count: 2), event: event2, card: "")
Invitation.create(attendee: Member.first, message: Faker::Lorem.paragraph(sentence_count: 1), event: event2, card: "")
Invitation.create(attendee: Member.all[10], message: Faker::Lorem.paragraph(sentence_count: 2), event: event2, card: "")
Invitation.create(attendee: Member.second, message: Faker::Lorem.paragraph(sentence_count: 3), event: event3, card: "")
Invitation.create(attendee: Member.third, message: Faker::Lorem.paragraph(sentence_count: 1), event: event3, card: "")
Invitation.create(attendee: Member.all[5], message: Faker::Lorem.paragraph(sentence_count: 1), event: event3, card: "")
Invitation.create(attendee: Member.all[6], message: Faker::Lorem.paragraph(sentence_count: 1), event: event3, card: "")
Invitation.create(attendee: Member.all[6], message: Faker::Lorem.paragraph(sentence_count: 2), event: event4, card: "")
Invitation.create(attendee: Member.all[4], message: Faker::Lorem.paragraph(sentence_count: 1), event: event4, card: "")
Invitation.create(attendee: Member.second, message: Faker::Lorem.paragraph(sentence_count: 1), event: event4, card: "")
Invitation.create(attendee: Member.third, message: Faker::Lorem.paragraph(sentence_count: 1), event: event4, card: "")


10.times do
    Announcement.create(
        description: Faker::Lorem.paragraph(sentence_count: 3), 
        member: Member.all.sample)
end


10.times do
    Review.create(
        description: Faker::Lorem.paragraph(sentence_count: 5), 
        event: Event.all.sample, 
        attendee_id: Invitation.all.sample.attendee,
        likes: Faker::Number.within(range: 1..10))
end

image_url = [
    "https://source.unsplash.com/2ShvY8Lf6l0/800x599",
    "https://source.unsplash.com/Dm-qxdynoEc/800x799",
    "https://source.unsplash.com/qDkso9nvCg0/600x799",
    "https://source.unsplash.com/iecJiKe_RNg/600x799",
    "https://source.unsplash.com/epcsn8Ed8kY/600x799",
    "https://source.unsplash.com/NQSWvyVRIJk/800x599",
    "https://source.unsplash.com/zh7GEuORbUw/600x799",
    "https://source.unsplash.com/PpOHJezOalU/800x599",
    "https://source.unsplash.com/I1ASdgphUH4/800x599"
]

20.times do
    Photo.create(src: image_url.sample, event_id: Event.all.sample.id, member_id: Member.all.sample.id)
end